Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64072F213F
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 22:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbhAKU7N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jan 2021 15:59:13 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59630 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbhAKU7F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Jan 2021 15:59:05 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10BKwExe103201;
        Mon, 11 Jan 2021 14:58:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610398694;
        bh=kLGnNWdilA4PhaFWEJD273Hb9spCPQiXzR3IJJI8xMc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=gdRqziwMXwB190QvvFFePHNYfrRiTr32p04oSISQRe7fmG/fASxUKeTyR992YFcNr
         +LL64RmjvNb2sBF1bxK9ZSuVpulutiuVBNQc4bO5p/z1NbZBDcOeDJ97IsNFIsxosR
         4no/PMMvDNF/ZhOLBIfGL9RRDQvQhTtKqbD9wMNs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10BKwEEp110191
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 Jan 2021 14:58:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 Jan 2021 14:58:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 Jan 2021 14:58:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10BKwDaH114717;
        Mon, 11 Jan 2021 14:58:13 -0600
Date:   Tue, 12 Jan 2021 02:28:12 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>
Subject: Re: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20210111205810.tipt54yk2dljim3l@ti.com>
References: <20210112073606.7cb02e42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210112073606.7cb02e42@canb.auug.org.au>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Cc checkpatch.pl maintainers.

On 12/01/21 07:36AM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   2ef0170e9039 ("spi: cadence-quadspi: Fix build warning on 32-bit platforms")
> 
> Fixes tag
> 
>   Fixes: f453f293979f ("spi: cadence-quadspi: Wait at least 500 ms for direct reads")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> Did yu mean
> 
> Fixes: f453f293979f ("spi: cadence-quadspi: Add DTR support")
> 
> or
> 
> Fixes: 0920a32cf6f2 ("spi: cadence-quadspi: Wait at least 500 ms for direct reads")

I meant this one. My mistake. Copied the wrong hash. Any way to fix this 
now?

This check should probably be added in checkpatch.pl so mistakes like 
this can be avoided in the future.

-- 
Regards,
Pratyush Yadav
Texas Instruments India
