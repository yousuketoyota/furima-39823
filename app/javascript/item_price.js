window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById("item-price");
  
  const updatePrice = () => {
    const price = parseFloat(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(price * 0.1);
    addTaxDom.innerHTML = tax;
    
    const addProfitDom = document.getElementById("profit");
    const profit = Math.floor(price - tax);
    addProfitDom.innerHTML = profit;
  };
  
  updatePrice();
  
  const resetEventListeners = () => {
    priceInput.removeEventListener("input", updatePrice); // 既存のリスナーを削除
    priceInput.addEventListener("input", updatePrice); // 新しいリスナーを追加
  };

  priceInput.addEventListener("input", resetEventListeners);
});

