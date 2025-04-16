module.exports = cds.service.impl(async function(){

    const {POs} = this.entities;
    
    this.on('boost', async(req) => {
        console.log('aa gya');
        try{
            const id = req.params[0];
            const tx = cds.tx(req);

            //CDS qury lang - communate using agnositc manner
            await tx.update(POs).with({
                GROSS_AMOUNT: {'+=': 20000}
            }).where(id);
    
        }catch(error) {
            return 'Error' + error.toString();
        }
    });

    this.on('largestOrder', async(req) => {
        console.log('Triggered');
        try{
            // const id = req.params[0];   
            const tx = cds.tx(req);

            //CDS qury lang - communate using agnositc manner
            const recordData = tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
            
            return recordData;
        }catch(error) {
            return 'Error' + error.toString();
        }
    });
});
 