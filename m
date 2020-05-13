Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBE71D2113
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 23:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgEMVaH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 17:30:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34746 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728718AbgEMVaH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2020 17:30:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DLTwxY105606;
        Wed, 13 May 2020 16:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589405398;
        bh=vcbFgmT3TN+BiEX3L7ygJ+nCexSav6b9m490239DnXM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UpYjjIAsWnRrMfzaoMrZjg1Tieg9gnCR9eYKoPDAnfr9xneKiwvmVfy1vOJgEISd8
         52eO8MowSK7nBtarM7M6Wlbh119cwHLrh7nGTPt2Di6+GmAop7KbjnowNFDnndbrYL
         GEL0LAfWtlpAp4BHMrZ8mDbTJC/BZ0kG0ttSZplg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DLTwUD105576;
        Wed, 13 May 2020 16:29:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 16:29:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 16:29:57 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DLTvI6019290;
        Wed, 13 May 2020 16:29:57 -0500
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc-fixes
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200514071257.5b1582ca@canb.auug.org.au>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f828c953-07b2-6a6b-881a-bf10f20a719d@ti.com>
Date:   Wed, 13 May 2020 16:20:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514071257.5b1582ca@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen

On 5/13/20 4:12 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>    0e36f32f6b6c ("ASoC: tlv320adcx140: Fix bias config values")
>
> Fixes tag
>
>    Fixes: 37bde5acf040 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec
>
> has these problem(s):
>
>    - Target SHA1 does not exist
>
> Mabe you meant
>
> Fixes: 689c7655b50c ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")

Yes this is what it is supposed to be

Mark

Did you want me to re-submit the patch with the corrected commit or are 
you going to update it?

I also noticed code was spelled wrong in the commit message

s/conde/code

Dan


> Also, it looks like the Fixes tag had been split over more than one line
> (and then the latter part moved above the rest).
>
