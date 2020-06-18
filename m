Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED0A1FF1BB
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 14:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbgFRM2d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 08:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbgFRM2L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 08:28:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B41BC06174E;
        Thu, 18 Jun 2020 05:28:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 11FC22A4B0A
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
Cc:     Boris Brezillon <bbrezillon@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
        Allison Randal <allison@lohutok.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernelci-results@groups.io, Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
        Enrico Weigelt <info@metux.net>,
        Mason Yang <masonccyang@mxic.com.tw>,
        linux-next@vger.kernel.org
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
Date:   Thu, 18 Jun 2020 13:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please see the bisection report below about a kernel panic.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

See the kernel Oops due to a NULL pointer followed by a panic:

  https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504

Thanks,
Guillaume


On 18/06/2020 13:20, kernelci.org bot wrote:
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
> next/master bisection: baseline.login on ox820-cloudengines-pogoplug-series-3
> 
> Summary:
>   Start:      ce2cc8efd7a4 Add linux-next specific files for 20200618
>   Plain log:  https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html
>   Result:     7b929258ff0e mtd: rawnand: Allocate the interface configurations dynamically
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     ox820-cloudengines-pogoplug-series-3
>   CPU arch:   arm
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     oxnas_v6_defconfig
>   Test case:  baseline.login
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 7b929258ff0e913616e21661a757f5ecb776d337
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
> Date:   Fri May 29 13:13:22 2020 +0200
> 
>     mtd: rawnand: Allocate the interface configurations dynamically
>     
>     Instead of manipulating the statically allocated structure and copy
>     timings around, allocate one at identification time and save it in the
>     nand_chip structure once it has been initialized.
>     
>     All NAND chips using the same interface configuration during reset and
>     startup, we define a helper to retrieve a single reset interface
>     configuration object, shared across all NAND chips.
>     
>     We use a second pointer to always have a reference on the currently
>     applied interface configuration, which may either point to the "best
>     interface configuration" or to the "default reset interface
>     configuration".
>     
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>     Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>     Link: https://lore.kernel.org/linux-mtd/20200529111322.7184-29-miquel.raynal@bootlin.com
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 5ebfbb89e572..012876e14317 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -93,6 +93,7 @@ onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
>  int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  				 struct nand_interface_config *iface,
>  				 struct nand_sdr_timings *spec_timings);
> +const struct nand_interface_config *nand_get_reset_interface_config(void);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 753328f106c1..4a0d486210e9 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -928,9 +928,9 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
>  	 * timings to timing mode 0.
>  	 */
>  
> -	onfi_fill_interface_config(chip, &chip->interface_config,
> -				   NAND_SDR_IFACE, 0);
> -	ret = ops->setup_interface(chip, chipnr, &chip->interface_config);
> +	chip->current_interface_config = nand_get_reset_interface_config();
> +	ret = ops->setup_interface(chip, chipnr,
> +				   chip->current_interface_config);
>  	if (ret)
>  		pr_err("Failed to configure data interface to SDR timing mode 0\n");
>  
> @@ -949,7 +949,8 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
>   */
>  static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  {
> -	u8 mode = chip->interface_config.timings.mode;
> +	const struct nand_controller_ops *ops = chip->controller->ops;
> +	u8 mode = chip->best_interface_config->timings.mode;
>  	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
>  	int ret;
>  
> @@ -967,14 +968,13 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  	}
>  
>  	/* Change the mode on the controller side */
> -	ret = chip->controller->ops->setup_interface(chip, chipnr,
> -						     &chip->interface_config);
> +	ret = ops->setup_interface(chip, chipnr, chip->best_interface_config);
>  	if (ret)
>  		return ret;
>  
>  	/* Check the mode has been accepted by the chip, if supported */
>  	if (!nand_supports_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE))
> -		return 0;
> +		goto update_interface_config;
>  
>  	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
>  	nand_select_target(chip, chipnr);
> @@ -990,6 +990,9 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  		goto err_reset_chip;
>  	}
>  
> +update_interface_config:
> +	chip->current_interface_config = chip->best_interface_config;
> +
>  	return 0;
>  
>  err_reset_chip:
> @@ -1031,8 +1034,10 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  		/* Verify the controller supports the requested interface */
>  		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
>  					   iface);
> -		if (!ret)
> +		if (!ret) {
> +			chip->best_interface_config = iface;
>  			return ret;
> +		}
>  
>  		/* Fallback to slower modes */
>  		best_mode = iface->timings.mode;
> @@ -1046,9 +1051,11 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
>  					   iface);
>  		if (!ret)
> -			return 0;
> +			break;
>  	}
>  
> +	chip->best_interface_config = iface;
> +
>  	return 0;
>  }
>  
> @@ -1067,15 +1074,25 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>   */
>  static int nand_choose_interface_config(struct nand_chip *chip)
>  {
> +	struct nand_interface_config *iface;
> +	int ret;
> +
>  	if (!nand_controller_can_setup_interface(chip))
>  		return 0;
>  
> +	iface = kzalloc(sizeof(*iface), GFP_KERNEL);
> +	if (!iface)
> +		return -ENOMEM;
> +
>  	if (chip->ops.choose_interface_config)
> -		return chip->ops.choose_interface_config(chip,
> -							 &chip->interface_config);
> +		ret = chip->ops.choose_interface_config(chip, iface);
> +	else
> +		ret = nand_choose_best_sdr_timings(chip, iface, NULL);
>  
> -	return nand_choose_best_sdr_timings(chip, &chip->interface_config,
> -					    NULL);
> +	if (ret)
> +		kfree(iface);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -2501,7 +2518,6 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
>   */
>  int nand_reset(struct nand_chip *chip, int chipnr)
>  {
> -	struct nand_interface_config saved_intf_config = chip->interface_config;
>  	int ret;
>  
>  	ret = nand_reset_interface(chip, chipnr);
> @@ -2526,11 +2542,9 @@ int nand_reset(struct nand_chip *chip, int chipnr)
>  	 * nand_setup_interface() uses ->set/get_features() which would
>  	 * fail anyway as the parameter page is not available yet.
>  	 */
> -	if (!memcmp(&chip->interface_config, &saved_intf_config,
> -		    sizeof(saved_intf_config)))
> +	if (!chip->best_interface_config)
>  		return 0;
>  
> -	chip->interface_config = saved_intf_config;
>  	ret = nand_setup_interface(chip, chipnr);
>  	if (ret)
>  		return ret;
> @@ -5198,7 +5212,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>  	mutex_init(&chip->lock);
>  
>  	/* Enforce the right timings for reset/detection */
> -	onfi_fill_interface_config(chip, &chip->interface_config, NAND_SDR_IFACE, 0);
> +	chip->current_interface_config = nand_get_reset_interface_config();
>  
>  	ret = nand_dt_init(chip);
>  	if (ret)
> @@ -5994,7 +6008,7 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	for (i = 0; i < nanddev_ntargets(&chip->base); i++) {
>  		ret = nand_setup_interface(chip, i);
>  		if (ret)
> -			goto err_nanddev_cleanup;
> +			goto err_free_interface_config;
>  	}
>  
>  	/* Check, if we should skip the bad block table scan */
> @@ -6004,10 +6018,12 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	/* Build bad block table */
>  	ret = nand_create_bbt(chip);
>  	if (ret)
> -		goto err_nanddev_cleanup;
> +		goto err_free_interface_config;
>  
>  	return 0;
>  
> +err_free_interface_config:
> +	kfree(chip->best_interface_config);
>  
>  err_nanddev_cleanup:
>  	nanddev_cleanup(&chip->base);
> @@ -6101,6 +6117,9 @@ void nand_cleanup(struct nand_chip *chip)
>  			& NAND_BBT_DYNAMICSTRUCT)
>  		kfree(chip->badblock_pattern);
>  
> +	/* Free the data interface */
> +	kfree(chip->best_interface_config);
> +
>  	/* Free manufacturer priv data. */
>  	nand_manufacturer_cleanup(chip);
>  
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 1e22006c79ba..94d832646487 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -292,6 +292,12 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
>  	},
>  };
>  
> +/* All NAND chips share the same reset data interface: SDR mode 0 */
> +const struct nand_interface_config *nand_get_reset_interface_config(void)
> +{
> +	return &onfi_sdr_timings[0];
> +}
> +
>  /**
>   * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
>   *                              set of timings
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index a2427c67d38b..a725b620aca2 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1069,7 +1069,11 @@ struct nand_manufacturer {
>   * @options: Various chip options. They can partly be set to inform nand_scan
>   *           about special functionality. See the defines for further
>   *           explanation.
> - * @interface_config: NAND interface timing information
> + * @current_interface_config: The currently used NAND interface configuration
> + * @best_interface_config: The best NAND interface configuration which fits both
> + *                         the NAND chip and NAND controller constraints. If
> + *                         unset, the default reset interface configuration must
> + *                         be used.
>   * @bbt_erase_shift: Number of address bits in a bbt entry
>   * @bbt_options: Bad block table specific options. All options used here must
>   *               come from bbm.h. By default, these options will be copied to
> @@ -1116,7 +1120,8 @@ struct nand_chip {
>  	unsigned int options;
>  
>  	/* Data interface */
> -	struct nand_interface_config interface_config;
> +	const struct nand_interface_config *current_interface_config;
> +	struct nand_interface_config *best_interface_config;
>  
>  	/* Bad block information */
>  	unsigned int bbt_erase_shift;
> @@ -1209,7 +1214,7 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
>  static inline const struct nand_interface_config *
>  nand_get_interface_config(struct nand_chip *chip)
>  {
> -	return &chip->interface_config;
> +	return chip->current_interface_config;
>  }
>  
>  /*
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [1b5044021070efa3259f3e9548dc35d1eb6aa844] Merge tag 'dma-mapping-5.8-3' of git://git.infradead.org/users/hch/dma-mapping
> git bisect good 1b5044021070efa3259f3e9548dc35d1eb6aa844
> # bad: [ce2cc8efd7a40cbd17841add878cb691d0ce0bba] Add linux-next specific files for 20200618
> git bisect bad ce2cc8efd7a40cbd17841add878cb691d0ce0bba
> # bad: [b91d047b9cb0441237354c3b4fd40fb5a6e649ef] next-20200616/amdgpu
> git bisect bad b91d047b9cb0441237354c3b4fd40fb5a6e649ef
> # good: [ff028acf8c34f3707946fc806b8873ddb95e0f9a] Merge remote-tracking branch 'hid/for-next'
> git bisect good ff028acf8c34f3707946fc806b8873ddb95e0f9a
> # good: [5073201f3b80c6d798519589a81263563b4f8520] drm/amdgpu: add internal reg offset translation for VCN inst 1
> git bisect good 5073201f3b80c6d798519589a81263563b4f8520
> # good: [f3cdec463796c25ab829e5959488f269812fa1bb] Merge remote-tracking branch 'gfs2/for-next'
> git bisect good f3cdec463796c25ab829e5959488f269812fa1bb
> # good: [1134d52d6f95ae61fbd2da980a29f05c656c5934] Revert "drm/[radeon|amdgpu]: Replace one-element array and use struct_size() helper"
> git bisect good 1134d52d6f95ae61fbd2da980a29f05c656c5934
> # good: [3b6588fa6f92297dc26681686fd3c719647576c4] mtd: rawnand: toshiba: Choose the interface configuration for TH58NVG2S3HBAI4
> git bisect good 3b6588fa6f92297dc26681686fd3c719647576c4
> # bad: [97bd0ed43524a3530d5651627779c0b40385187e] mtd: rawnand: qcom: set BAM mode only if not set already
> git bisect bad 97bd0ed43524a3530d5651627779c0b40385187e
> # bad: [ebbd1aae9deeccf8c2adcd84dd536b451110bf07] mtd: rawnand: fsl_upm: Use gpio descriptors
> git bisect bad ebbd1aae9deeccf8c2adcd84dd536b451110bf07
> # bad: [d8a826cfb059b2d5d4e97ced9469d6bcf7cf40f7] mtd: rawnand: fsl_upm: Get rid of the unused fsl_upm_nand.parts field
> git bisect bad d8a826cfb059b2d5d4e97ced9469d6bcf7cf40f7
> # bad: [7b929258ff0e913616e21661a757f5ecb776d337] mtd: rawnand: Allocate the interface configurations dynamically
> git bisect bad 7b929258ff0e913616e21661a757f5ecb776d337
> # good: [a82f691ad48c63af22844cee4eb3107cf5d9ff00] mtd: rawnand: Get rid of the default ONFI timing mode
> git bisect good a82f691ad48c63af22844cee4eb3107cf5d9ff00
> # first bad commit: [7b929258ff0e913616e21661a757f5ecb776d337] mtd: rawnand: Allocate the interface configurations dynamically
> -------------------------------------------------------------------------------
> 

