window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const totalInput = document.getElementById("profit");
  const tax = 0.1;

  const calculateAndDisplay = () => {
    const inputValue = parseFloat(priceInput.value);

    if (!isNaN(inputValue)) { // 入力が数字であることを確認
      const taxAmount = Math.floor(inputValue * tax);
      addTaxDom.innerHTML = taxAmount;
      totalInput.innerHTML = Math.floor(inputValue - taxAmount);
    } else { // 入力が数字でない場合、手数料と利益を空にする
      addTaxDom.innerHTML = "";
      totalInput.innerHTML = "";
    }
  };

  priceInput.addEventListener("input", calculateAndDisplay);
});
