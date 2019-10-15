Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADF8D7517
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 13:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfJOLeg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 07:34:36 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46076 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfJOLeg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 07:34:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FBYRer088831;
        Tue, 15 Oct 2019 06:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571139267;
        bh=0oWSdj+wKQfLPRVqyBwkOOe1Ornzu91NVpb9wTiFoJQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LNFbRblO891zBwNhC4gnWUAmWfLCx0rmos/L8SfRKYHYbsdhaoFhO0SDzucwzX1TL
         CuhPCSLrgQuQwzxH/G1N08VDOO/M2Z2uptVhTyWhgVOD4RCs+sA478sHf1yS+EXZ+3
         P7GbwZwOaSnsY7UuL+fqNMqOZCC32KEIVVmo6y0M=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FBYRHt096124;
        Tue, 15 Oct 2019 06:34:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 15
 Oct 2019 06:34:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 15 Oct 2019 06:34:21 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FBYP1p050592;
        Tue, 15 Oct 2019 06:34:26 -0500
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191015223027.7a381186@canb.auug.org.au>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <915f0e00-490a-6826-8cf1-43924870f443@ti.com>
Date:   Tue, 15 Oct 2019 14:35:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015223027.7a381186@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 15/10/2019 14.30, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   a35716a95655 ("ASoC: pcm3168a: Fix serial mode dependent format support")
> 
> Fixes tag
> 
>   Fixes: ("ASoC: pcm3168a: Use fixup instead of constraint for channels and formats")
> 
> has these problem(s):
> 
>   - No SHA1 recognised
> 
> Did you mean
> 
> Fixes: cfc28ac124c4 ("ASoC: pcm3168a: Use fixup instead of constraint for channels and formats")

Not again, I have left out the SHA1 to look it up in linux-next which I
failed to do.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
