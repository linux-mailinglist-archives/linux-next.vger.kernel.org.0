Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22F26038EB
	for <lists+linux-next@lfdr.de>; Wed, 19 Oct 2022 06:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiJSErW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Oct 2022 00:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJSErU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Oct 2022 00:47:20 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBD557BC7
        for <linux-next@vger.kernel.org>; Tue, 18 Oct 2022 21:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666154838; x=1697690838;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cwkQy8S+xJQ3oRJixaoeXcQV4Pop4Vcj2Eu1B18TgP8=;
  b=NaX/NC3LNLeDWFp3uWk1l71H/T1fdqK5DYrLnolGM6U47i35ECYEo3zC
   kzsRhiPoC59Rx+ehalH+RLzBM+NXHkDhRbKgg8gY+9Uz/GfE8RbfjLsX8
   HwQ5HsY1yEKYwp3KVHQx1vfFtBqvmUiZwqjqVJbpyd7nFRqEnc0YzC/go
   ORWwhoNMav4IxC534mn6SQmSM8dHJn1Gzo+QMDsKacb0g/Ae4wm728KXa
   783N20DSSKO/LH46dG+rYCMvD3jdGOMTe97rPqfISG9C9D2yAruWk4r2e
   xWQCzjnhU9pQyO05865p3pmHSTg9B8yVjieYiJ8aRhjvDhzEnH5R0cBYs
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,195,1661788800"; 
   d="scan'208";a="214574329"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Oct 2022 12:47:18 +0800
IronPort-SDR: cgBtWj0UujABDZP7EE91K+hC+ZlkClcMV+y+rtQMdzvJ8VRHZOWMRh8sF4RoRLfd5aJVQAJaW/
 HUoQ0116Tg765wzfPUcxHoIp6QDwYgaeffeamq5OkL0jZrHEIXs40zEJXyLFKDmNhjm1xffzkm
 DWC9q45odULfzTg1wVYT41SstMvLsJAi+hZQCDc8g4rQl0DiSBgsDhVkOD9xTGpqsa1sLCszi+
 3fjYUXoE7PFCIWWnJ7l2HnyEcpizuGavWqvO/mBN5KxyXngypfwN33vDkfv3ypx4AMiDhQpHJ3
 vLojXlSSUybOw7RfW0WVJjkC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Oct 2022 21:01:09 -0700
IronPort-SDR: IS6hobVDawStTynHYR2tk4S6SE1STJQkbjzkglsy1dTvQBSTEcsojUhsCs0EvTYMrEtiPoETA3
 SH+cbWQCNLzxab/cS88tXHAjWtR5bPq6T0Jgn1vlTbgXqSb7HSRs6m3yvQD6PvuynNDx5sHOjn
 KT51oVuQaYspYgenweGVmtJw6rme1vdDxfmX5CZC08OMyzsLGNeIhV0ldchIt4Wft4BDKNez+k
 jWk09UJXZmptIDBewhRrb94jWG/v/DwF7HaEDOVgEWrUEAsO5CBtfHCH13JL9CarcElxdWJq/G
 2Rs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Oct 2022 21:47:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MsdW973SYz1RvTr
        for <linux-next@vger.kernel.org>; Tue, 18 Oct 2022 21:47:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1666154837; x=1668746838; bh=cwkQy8S+xJQ3oRJixaoeXcQV4Pop4Vcj2Eu
        1B18TgP8=; b=NyAdErGlsU9Su1UferdAK+EqJCfg3Aia4L9dUo0guy/VpyscUas
        XpKdPw2SS+BRHDJq6YFILsWwtKgIYjKl70EAVjnqGPzp156XJMW5JoGu2gTCDGfn
        vJxosxPkTpE/OFPJEKUeGHceAliSOS3sxq/welB1boUbO1nDgEOvRXuIgBYgiXZJ
        OgG0Ym/RA47+LzHdsoOK8mrA8vy2yvGudRgBtfBr4oJ+jzThIV3R9u58wi27Awj+
        ESxescQ4IpYc8YoZ3bSHNGKnWX2PL9gq+numaAMYX86Aap8neBfY1kvIXnEj2mO3
        uPikwBtsMp3uxkpUPiSzPhpqBuw5nLCQrUQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id kg8DJEjZSrRv for <linux-next@vger.kernel.org>;
        Tue, 18 Oct 2022 21:47:17 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MsdW90vLrz1RvLy;
        Tue, 18 Oct 2022 21:47:16 -0700 (PDT)
Message-ID: <ac0b4f51-acdb-a5d3-07f8-8e96a8a5a6e6@opensource.wdc.com>
Date:   Wed, 19 Oct 2022 13:47:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: linux-next: Signed-off-by missing for commit in the libata tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221019072605.7d6c8cbd@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221019072605.7d6c8cbd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/19/22 05:26, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   61503af327ca ("scsi: libsas: make use of ata_port_is_frozen() helper")
> 
> is missing a Signed-off-by from its committer.

Oops. My bad. Fixed now.
Thanks !

-- 
Damien Le Moal
Western Digital Research

