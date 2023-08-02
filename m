Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C449D76CBBD
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 13:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbjHBLZi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 07:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbjHBLZh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 07:25:37 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7F5211E;
        Wed,  2 Aug 2023 04:25:35 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 372BP8ag113788;
        Wed, 2 Aug 2023 06:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1690975508;
        bh=+s17pGQ5nw8OJy0W+2beGPow7MJvggP/LQi00STyfv8=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=CXmO842bQMTv5DfngvyShfos6PHbze20mbZ01psfDs3ZI0TYU133tAu4Cj5yztkBX
         TGrRIAbJlWNqC90w4icblogPt39JEx6iZa1Xk4j3Nh12SC+G46yt5iPOYrgftqIYFP
         h3ehBrzZ2HIY/penttrFqCdYdC4fMOG1MNzAwZ3c=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 372BP85c014809
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Aug 2023 06:25:08 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 06:25:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Aug 2023 06:25:08 -0500
Received: from [10.249.141.75] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 372BP2Vf103322;
        Wed, 2 Aug 2023 06:25:02 -0500
Message-ID: <97281aba-a78c-7f75-fc15-af43e4df4907@ti.com>
Date:   Wed, 2 Aug 2023 16:55:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 11/12] scsi: ufs: Simplify transfer request header
 initialization
To:     Bart Van Assche <bvanassche@acm.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
CC:     <linux-scsi@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
        Eric Biggers <ebiggers@google.com>,
        Bean Huo <beanhuo@micron.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Can Guo <quic_cang@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Po-Wen Kao <powen.kao@mediatek.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Nishanth Menon <nm@ti.com>, <d-gole@ti.com>,
        <linux-next@vger.kernel.org>, <u-kumar1@ti.com>
References: <20230727194457.3152309-1-bvanassche@acm.org>
 <20230727194457.3152309-12-bvanassche@acm.org>
Content-Language: en-US
From:   "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20230727194457.3152309-12-bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Bart,

On 7/28/2023 1:11 AM, Bart Van Assche wrote:
> Make the code that initializes UTP transfer request headers easier to
> read by using bitfields instead of __le32 where appropriate.
>
> Cc: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Cc: Eric Biggers <ebiggers@google.com>
> Cc: Avri Altman <avri.altman@wdc.com>
> Cc: Bean Huo <beanhuo@micron.com>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   [...]
>   
> +static void ufshcd_check_header_layout(void)
> +{
> +	BUILD_BUG_ON(((u8 *)&(struct request_desc_header){
> +				.cci = 3})[0] != 3);
> +
> +	BUILD_BUG_ON(((u8 *)&(struct request_desc_header){
> +				.ehs_length = 2})[1] != 2);
> +
> +	BUILD_BUG_ON(((u8 *)&(struct request_desc_header){
> +				.enable_crypto = 1})[2]
> +		     != 0x80);
> +
> +	BUILD_BUG_ON((((u8 *)&(struct request_desc_header){
> +					.command_type = 5,
> +					.data_direction = 3,
> +					.interrupt = 1,
> +				})[3]) != ((5 << 4) | (3 << 1) | 1));
> +
> +	BUILD_BUG_ON(((__le32 *)&(struct request_desc_header){
> +				.dunl = cpu_to_le32(0xdeadbeef)})[1] !=
> +		cpu_to_le32(0xdeadbeef));
> +
> +	BUILD_BUG_ON(((u8 *)&(struct request_desc_header){
> +				.ocs = 4})[8] != 4);
> +
> +	BUILD_BUG_ON(((u8 *)&(struct request_desc_header){
> +				.cds = 5})[9] != 5);
> +
> +	BUILD_BUG_ON(((__le32 *)&(struct request_desc_header){
> +				.dunu = cpu_to_le32(0xbadcafe)})[3] !=
> +		cpu_to_le32(0xbadcafe));
> +}
> +

While building next-20230801 for ARM64 architecture,

this patch is giving compilation error

In function ‘ufshcd_check_header_layout’,
     inlined from ‘ufshcd_core_init’ at drivers/ufs/core/ufshcd.c:10629:2:
././include/linux/compiler_types.h:397:38: error: call to 
‘__compiletime_assert_554’ declared with attribute error: BUILD_BUG_ON 
failed: ((u8 *)&(struct request_desc_header){ .enable_crypto = 1})[2] != 
0x80
   397 |  _compiletime_assert(condition, msg, __compiletime_assert_, 
__COUNTER__)


compiler information

wget 
https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz

tar -Jxvf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz

Build steps

make ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- defconfig

make ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- Image


>   [...]
