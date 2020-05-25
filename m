Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECD01E0908
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 10:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbgEYIje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 04:39:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41438 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388283AbgEYIjd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 04:39:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 6E3DF2A0379
Subject: Re: next/master bisection: baseline.login on meson-sm1-sei610
To:     Felipe Balbi <balbi@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <5ec9617c.1c69fb81.b979a.bf47@mx.google.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-next@vger.kernel.org,
        kernelci-results@groups.io
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <ffe2c64c-62ed-9b59-3754-7ede0f0203be@collabora.com>
Date:   Mon, 25 May 2020 09:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5ec9617c.1c69fb81.b979a.bf47@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please see the bisection report below about a kernel Oops.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

Guillaume


On 23/05/2020 18:46, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> next/master bisection: baseline.login on meson-sm1-sei610
> 
> Summary:
>   Start:      c11d28ab4a691 Add linux-next specific files for 20200522
>   Plain log:  https://storage.kernelci.org/next/master/next-20200522/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20200522/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.html
>   Result:     013af227f58a9 usb: dwc3: meson-g12a: handle the phy and glue registers separately
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     meson-sm1-sei610
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     defconfig
>   Test case:  baseline.login
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 013af227f58a97ffc61b99301f8f4448dc7e7f55
> Author: Neil Armstrong <narmstrong@baylibre.com>
> Date:   Thu Mar 26 14:44:55 2020 +0100
> 
>     usb: dwc3: meson-g12a: handle the phy and glue registers separately
>     
>     On the Amlogic GXL/GXM SoCs, only the USB control registers are available,
>     the PHY mode being handled in the PHY registers.
>     
>     Thus, handle the PHY mode registers in separate regmaps and prepare
>     support for Amlogic GXL/GXM SoCs by moving the regmap setup in a callback
>     set in the SoC match data.
>     
>     Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>     Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>     Signed-off-by: Felipe Balbi <balbi@kernel.org>
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index f49c9e2665376..d7eff4d7c5fe6 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -30,7 +30,7 @@
>  #include <linux/usb/role.h>
>  #include <linux/regulator/consumer.h>
>  
> -/* USB2 Ports Control Registers */
> +/* USB2 Ports Control Registers, offsets are per-port */
>  
>  #define U2P_REG_SIZE						0x20
>  
> @@ -50,14 +50,16 @@
>  
>  /* USB Glue Control Registers */
>  
> -#define USB_R0							0x80
> +#define G12A_GLUE_OFFSET					0x80
> +
> +#define USB_R0							0x00
>  	#define USB_R0_P30_LANE0_TX2RX_LOOPBACK			BIT(17)
>  	#define USB_R0_P30_LANE0_EXT_PCLK_REQ			BIT(18)
>  	#define USB_R0_P30_PCS_RX_LOS_MASK_VAL_MASK		GENMASK(28, 19)
>  	#define USB_R0_U2D_SS_SCALEDOWN_MODE_MASK		GENMASK(30, 29)
>  	#define USB_R0_U2D_ACT					BIT(31)
>  
> -#define USB_R1							0x84
> +#define USB_R1							0x04
>  	#define USB_R1_U3H_BIGENDIAN_GS				BIT(0)
>  	#define USB_R1_U3H_PME_ENABLE				BIT(1)
>  	#define USB_R1_U3H_HUB_PORT_OVERCURRENT_MASK		GENMASK(4, 2)
> @@ -69,23 +71,23 @@
>  	#define USB_R1_U3H_FLADJ_30MHZ_REG_MASK			GENMASK(24, 19)
>  	#define USB_R1_P30_PCS_TX_SWING_FULL_MASK		GENMASK(31, 25)
>  
> -#define USB_R2							0x88
> +#define USB_R2							0x08
>  	#define USB_R2_P30_PCS_TX_DEEMPH_3P5DB_MASK		GENMASK(25, 20)
>  	#define USB_R2_P30_PCS_TX_DEEMPH_6DB_MASK		GENMASK(31, 26)
>  
> -#define USB_R3							0x8c
> +#define USB_R3							0x0c
>  	#define USB_R3_P30_SSC_ENABLE				BIT(0)
>  	#define USB_R3_P30_SSC_RANGE_MASK			GENMASK(3, 1)
>  	#define USB_R3_P30_SSC_REF_CLK_SEL_MASK			GENMASK(12, 4)
>  	#define USB_R3_P30_REF_SSP_EN				BIT(13)
>  
> -#define USB_R4							0x90
> +#define USB_R4							0x10
>  	#define USB_R4_P21_PORT_RESET_0				BIT(0)
>  	#define USB_R4_P21_SLEEP_M0				BIT(1)
>  	#define USB_R4_MEM_PD_MASK				GENMASK(3, 2)
>  	#define USB_R4_P21_ONLY					BIT(4)
>  
> -#define USB_R5							0x94
> +#define USB_R5							0x14
>  	#define USB_R5_ID_DIG_SYNC				BIT(0)
>  	#define USB_R5_ID_DIG_REG				BIT(1)
>  	#define USB_R5_ID_DIG_CFG_MASK				GENMASK(3, 2)
> @@ -125,20 +127,27 @@ static const char *meson_a1_phy_names[] = {
>  	"usb2-phy0", "usb2-phy1"
>  };
>  
> +struct dwc3_meson_g12a;
> +
>  struct dwc3_meson_g12a_drvdata {
>  	bool otg_switch_supported;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
>  	const char **phy_names;
>  	int num_phys;
> +	int (*setup_regmaps)(struct dwc3_meson_g12a *priv, void __iomem *base);
>  };
>  
> +static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
> +					 void __iomem *base);
> +
>  static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
>  	.otg_switch_supported = true,
>  	.clks = meson_g12a_clocks,
>  	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
>  	.phy_names = meson_g12a_phy_names,
>  	.num_phys = ARRAY_SIZE(meson_g12a_phy_names),
> +	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
>  };
>  
>  static struct dwc3_meson_g12a_drvdata a1_drvdata = {
> @@ -147,11 +156,13 @@ static struct dwc3_meson_g12a_drvdata a1_drvdata = {
>  	.num_clks = ARRAY_SIZE(meson_a1_clocks),
>  	.phy_names = meson_a1_phy_names,
>  	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
> +	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
>  };
>  
>  struct dwc3_meson_g12a {
>  	struct device		*dev;
> -	struct regmap		*regmap;
> +	struct regmap		*u2p_regmap[PHY_COUNT];
> +	struct regmap		*usb_glue_regmap;
>  	struct reset_control	*reset;
>  	struct phy		*phys[PHY_COUNT];
>  	enum usb_dr_mode	otg_mode;
> @@ -168,11 +179,11 @@ static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
>  					  int i, enum phy_mode mode)
>  {
>  	if (mode == PHY_MODE_USB_HOST)
> -		regmap_update_bits(priv->regmap, U2P_R0 + (U2P_REG_SIZE * i),
> +		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
>  				U2P_R0_HOST_DEVICE,
>  				U2P_R0_HOST_DEVICE);
>  	else
> -		regmap_update_bits(priv->regmap, U2P_R0 + (U2P_REG_SIZE * i),
> +		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
>  				U2P_R0_HOST_DEVICE, 0);
>  }
>  
> @@ -192,13 +203,12 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>  		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
>  			continue;
>  
> -		regmap_update_bits(priv->regmap, U2P_R0 + (U2P_REG_SIZE * i),
> +		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
>  				   U2P_R0_POWER_ON_RESET,
>  				   U2P_R0_POWER_ON_RESET);
>  
>  		if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
> -			regmap_update_bits(priv->regmap,
> -				U2P_R0 + (U2P_REG_SIZE * i),
> +			regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
>  				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
>  				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
>  
> @@ -208,7 +218,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>  			dwc3_meson_g12a_usb2_set_mode(priv, i,
>  						      PHY_MODE_USB_HOST);
>  
> -		regmap_update_bits(priv->regmap, U2P_R0 + (U2P_REG_SIZE * i),
> +		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
>  				   U2P_R0_POWER_ON_RESET, 0);
>  	}
>  
> @@ -217,7 +227,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>  
>  static void dwc3_meson_g12a_usb3_init(struct dwc3_meson_g12a *priv)
>  {
> -	regmap_update_bits(priv->regmap, USB_R3,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R3,
>  			USB_R3_P30_SSC_RANGE_MASK |
>  			USB_R3_P30_REF_SSP_EN,
>  			USB_R3_P30_SSC_ENABLE |
> @@ -225,21 +235,21 @@ static void dwc3_meson_g12a_usb3_init(struct dwc3_meson_g12a *priv)
>  			USB_R3_P30_REF_SSP_EN);
>  	udelay(2);
>  
> -	regmap_update_bits(priv->regmap, USB_R2,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R2,
>  			USB_R2_P30_PCS_TX_DEEMPH_3P5DB_MASK,
>  			FIELD_PREP(USB_R2_P30_PCS_TX_DEEMPH_3P5DB_MASK, 0x15));
>  
> -	regmap_update_bits(priv->regmap, USB_R2,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R2,
>  			USB_R2_P30_PCS_TX_DEEMPH_6DB_MASK,
>  			FIELD_PREP(USB_R2_P30_PCS_TX_DEEMPH_6DB_MASK, 0x20));
>  
>  	udelay(2);
>  
> -	regmap_update_bits(priv->regmap, USB_R1,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R1,
>  			USB_R1_U3H_HOST_PORT_POWER_CONTROL_PRESENT,
>  			USB_R1_U3H_HOST_PORT_POWER_CONTROL_PRESENT);
>  
> -	regmap_update_bits(priv->regmap, USB_R1,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R1,
>  			USB_R1_P30_PCS_TX_SWING_FULL_MASK,
>  			FIELD_PREP(USB_R1_P30_PCS_TX_SWING_FULL_MASK, 127));
>  }
> @@ -247,16 +257,16 @@ static void dwc3_meson_g12a_usb3_init(struct dwc3_meson_g12a *priv)
>  static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv)
>  {
>  	if (priv->otg_phy_mode == PHY_MODE_USB_DEVICE) {
> -		regmap_update_bits(priv->regmap, USB_R0,
> +		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
>  				USB_R0_U2D_ACT, USB_R0_U2D_ACT);
> -		regmap_update_bits(priv->regmap, USB_R0,
> +		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
>  				USB_R0_U2D_SS_SCALEDOWN_MODE_MASK, 0);
> -		regmap_update_bits(priv->regmap, USB_R4,
> +		regmap_update_bits(priv->usb_glue_regmap, USB_R4,
>  				USB_R4_P21_SLEEP_M0, USB_R4_P21_SLEEP_M0);
>  	} else {
> -		regmap_update_bits(priv->regmap, USB_R0,
> +		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
>  				USB_R0_U2D_ACT, 0);
> -		regmap_update_bits(priv->regmap, USB_R4,
> +		regmap_update_bits(priv->usb_glue_regmap, USB_R4,
>  				USB_R4_P21_SLEEP_M0, 0);
>  	}
>  }
> @@ -269,17 +279,17 @@ static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv)
>  	if (ret)
>  		return ret;
>  
> -	regmap_update_bits(priv->regmap, USB_R1,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R1,
>  			USB_R1_U3H_FLADJ_30MHZ_REG_MASK,
>  			FIELD_PREP(USB_R1_U3H_FLADJ_30MHZ_REG_MASK, 0x20));
>  
> -	regmap_update_bits(priv->regmap, USB_R5,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R5,
>  			USB_R5_ID_DIG_EN_0,
>  			USB_R5_ID_DIG_EN_0);
> -	regmap_update_bits(priv->regmap, USB_R5,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R5,
>  			USB_R5_ID_DIG_EN_1,
>  			USB_R5_ID_DIG_EN_1);
> -	regmap_update_bits(priv->regmap, USB_R5,
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R5,
>  			USB_R5_ID_DIG_TH_MASK,
>  			FIELD_PREP(USB_R5_ID_DIG_TH_MASK, 0xff));
>  
> @@ -292,7 +302,8 @@ static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv)
>  	return 0;
>  }
>  
> -static const struct regmap_config phy_meson_g12a_usb3_regmap_conf = {
> +static const struct regmap_config phy_meson_g12a_usb_glue_regmap_conf = {
> +	.name = "usb-glue",
>  	.reg_bits = 8,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> @@ -329,7 +340,7 @@ static enum phy_mode dwc3_meson_g12a_get_id(struct dwc3_meson_g12a *priv)
>  {
>  	u32 reg;
>  
> -	regmap_read(priv->regmap, USB_R5, &reg);
> +	regmap_read(priv->usb_glue_regmap, USB_R5, &reg);
>  
>  	if (reg & (USB_R5_ID_DIG_SYNC | USB_R5_ID_DIG_REG))
>  		return PHY_MODE_USB_DEVICE;
> @@ -405,7 +416,8 @@ static irqreturn_t dwc3_meson_g12a_irq_thread(int irq, void *data)
>  			dev_warn(priv->dev, "Failed to switch OTG mode\n");
>  	}
>  
> -	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_IRQ, 0);
> +	regmap_update_bits(priv->usb_glue_regmap, USB_R5,
> +			   USB_R5_ID_DIG_IRQ, 0);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -440,7 +452,7 @@ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
>  
>  	if (priv->otg_mode == USB_DR_MODE_OTG) {
>  		/* Ack irq before registering */
> -		regmap_update_bits(priv->regmap, USB_R5,
> +		regmap_update_bits(priv->usb_glue_regmap, USB_R5,
>  				   USB_R5_ID_DIG_IRQ, 0);
>  
>  		irq = platform_get_irq(pdev, 0);
> @@ -476,6 +488,41 @@ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
> +					 void __iomem *base)
> +{
> +	int i;
> +
> +	priv->usb_glue_regmap = devm_regmap_init_mmio(priv->dev,
> +					base + G12A_GLUE_OFFSET,
> +					&phy_meson_g12a_usb_glue_regmap_conf);
> +	if (IS_ERR(priv->usb_glue_regmap))
> +		return PTR_ERR(priv->usb_glue_regmap);
> +
> +	/* Create a regmap for each USB2 PHY control register set */
> +	for (i = 0; i < priv->usb2_ports; i++) {
> +		struct regmap_config u2p_regmap_config = {
> +			.reg_bits = 8,
> +			.val_bits = 32,
> +			.reg_stride = 4,
> +			.max_register = U2P_R1,
> +		};
> +
> +		u2p_regmap_config.name = devm_kasprintf(priv->dev, GFP_KERNEL,
> +							"u2p-%d", i);
> +		if (!u2p_regmap_config.name)
> +			return -ENOMEM;
> +
> +		priv->u2p_regmap[i] = devm_regmap_init_mmio(priv->dev,
> +						base + (i * U2P_REG_SIZE),
> +						&u2p_regmap_config);
> +		if (IS_ERR(priv->u2p_regmap[i]))
> +			return PTR_ERR(priv->u2p_regmap[i]);
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_meson_g12a	*priv;
> @@ -492,10 +539,12 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	priv->regmap = devm_regmap_init_mmio(dev, base,
> -					     &phy_meson_g12a_usb3_regmap_conf);
> -	if (IS_ERR(priv->regmap))
> -		return PTR_ERR(priv->regmap);
> +	priv->drvdata = of_device_get_match_data(&pdev->dev);
> +
> +	priv->dev = dev;
> +	ret = priv->drvdata->setup_regmaps(priv, base);
> +	if (ret)
> +		return ret;
>  
>  	priv->vbus = devm_regulator_get_optional(dev, "vbus");
>  	if (IS_ERR(priv->vbus)) {
> @@ -504,8 +553,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  		priv->vbus = NULL;
>  	}
>  
> -	priv->drvdata = of_device_get_match_data(&pdev->dev);
> -
>  	ret = devm_clk_bulk_get(dev,
>  				priv->drvdata->num_clks,
>  				priv->drvdata->clks);
> @@ -518,7 +565,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	platform_set_drvdata(pdev, priv);
> -	priv->dev = dev;
>  
>  	priv->reset = devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(priv->reset)) {
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [051143e1602d90ea71887d92363edd539d411de5] Merge tag 'apparmor-pr-2020-05-21' of git://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor
> git bisect good 051143e1602d90ea71887d92363edd539d411de5
> # bad: [c11d28ab4a691736e30b49813fb801847bd44e83] Add linux-next specific files for 20200522
> git bisect bad c11d28ab4a691736e30b49813fb801847bd44e83
> # good: [df7926cf2d7421586d4a2e2641206a59303b6ed0] Merge remote-tracking branch 'crypto/master'
> git bisect good df7926cf2d7421586d4a2e2641206a59303b6ed0
> # good: [22f04c4413814d3b42424eb7b088022ba2ed53ee] next-20200518/tip
> git bisect good 22f04c4413814d3b42424eb7b088022ba2ed53ee
> # bad: [82ca9f0ddfe370eae76d35e1972ac8267e4808ed] Merge remote-tracking branch 'staging/staging-next'
> git bisect bad 82ca9f0ddfe370eae76d35e1972ac8267e4808ed
> # bad: [1237e48654fb052ad365f22bf5b1fdc21d8fc2bd] Merge remote-tracking branch 'phy-next/next'
> git bisect bad 1237e48654fb052ad365f22bf5b1fdc21d8fc2bd
> # good: [4aee12750ad1a94d0a9f029ab2b3232538c81769] Merge remote-tracking branch 'kvm/linux-next'
> git bisect good 4aee12750ad1a94d0a9f029ab2b3232538c81769
> # good: [8579b345bb924fecc6b8c75e55aee8569d2b5eae] Merge remote-tracking branch 'usb/usb-next'
> git bisect good 8579b345bb924fecc6b8c75e55aee8569d2b5eae
> # bad: [ec948d2c4511002b8511451e8f318603453eb0b8] usb: dwc3: gadget: Handle XferComplete for streams
> git bisect bad ec948d2c4511002b8511451e8f318603453eb0b8
> # bad: [32e51c59a00c8cef62cb8e5b846dafb3d94d58ab] usb: cdns3: change dev_info to dev_dbg for debug message
> git bisect bad 32e51c59a00c8cef62cb8e5b846dafb3d94d58ab
> # good: [8f385b67555415cb01079a8ad3b1e16010c5005b] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic GXL and GXM Families USB Glue Bindings
> git bisect good 8f385b67555415cb01079a8ad3b1e16010c5005b
> # bad: [9bc3395c24962e8c8e4f590ca2740c56e4a7a4fe] usb: dwc3: gadget: Store resource index of start cmd
> git bisect bad 9bc3395c24962e8c8e4f590ca2740c56e4a7a4fe
> # bad: [8f5bc1ec770c2bdc8c604ba4119a77d81d8f3529] usb: dwc3: meson-g12a: check return of dwc3_meson_g12a_usb_init
> git bisect bad 8f5bc1ec770c2bdc8c604ba4119a77d81d8f3529
> # bad: [013af227f58a97ffc61b99301f8f4448dc7e7f55] usb: dwc3: meson-g12a: handle the phy and glue registers separately
> git bisect bad 013af227f58a97ffc61b99301f8f4448dc7e7f55
> # good: [5174564cb9156a7c7b4d94a64c1cafdfd9a20403] usb: dwc3: meson-g12a: specify phy names in soc data
> git bisect good 5174564cb9156a7c7b4d94a64c1cafdfd9a20403
> # first bad commit: [013af227f58a97ffc61b99301f8f4448dc7e7f55] usb: dwc3: meson-g12a: handle the phy and glue registers separately
> -------------------------------------------------------------------------------
> 

