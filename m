Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CD54374E2
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 11:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhJVJlC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 05:41:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41678 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhJVJlB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 05:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634895524; x=1666431524;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=FwWHFiTyuZ4DhFbgzIdL2AIGl6n8DFMRj6YhMJTHOic=;
  b=GlX+x4dGcuUf72e4A5G5Kn+w3+dTs8tkVO++wkBR1euLsMi+4FdTZDWK
   W8xBqybrHvMfPiD2M9LlAtVg6eYZhWjoyx137eH4WsfmcIWQk5SzWMajE
   eCDIc6t69uu8ZZaKyX8sZm+eTk+NqIk/2oq7TCSL1j3NVB7DiEiyB9B2s
   RsmgsVNISZlRsw2syMG2tnvLjo3LIQm+SL1qYs1M9gzrAnRu9ZU53ZVlT
   tWg6LMRUisqQA8qKVL/jBdbWDYRHzTgdjKIu0/K7ytBXZXFH/fVI0CG0i
   2Ybipm7cDUF+XQQPZTWC43FxgmVmSAT6rCeAUXbEgvCAT9LgnSyLwDOrX
   w==;
IronPort-SDR: 4h2g7uZ3dTfBnXeVb5dsOcCgEjDE3UseshPGlYc3xcYoxTa0Zgw5XYApD6UyN4P+h+pMNDvVcl
 r0DVPtmUNuXn0sIwY8TiSCrqdgzkHi5kGcL1xRAlWHAVYsn40HeS1wJk3RSvw4nkwmzIMYiKgN
 BWeB4PbzIVZX6yi75De4recayzH4IBexm419c3A+ZGi/tfu8Vqps88dmL95u7wxFQVBCc8H8vZ
 vaFo6TrcDapfh1/ezYFDz8iSqxf7Z/M3Kc1CmNks4ZjxT4bPuka5UvgqijqFMA/RZI4wsQsP86
 DdIk1L6Yr/IelK68W8adTSUs
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="73939202"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 02:38:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 02:38:43 -0700
Received: from [10.171.246.101] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Fri, 22 Oct 2021 02:38:41 -0700
Subject: Re: linux-next: manual merge of the at91 tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Nicolas Ferre <nicolas.ferre@atmel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
CC:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211022085641.57d666a4@canb.auug.org.au>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <0235edf0-9b33-9a88-3793-9062e59b8711@microchip.com>
Date:   Fri, 22 Oct 2021 11:38:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211022085641.57d666a4@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 21/10/2021 at 23:56, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the at91 tree got a conflict in:
> 
>    arch/arm/boot/dts/sama7g5.dtsi
> 
> between commit:
> 
>    6f3466228451 ("ARM: dts: at91: sama7g5: add chipid")
> 
> from Linus' tree and commit:
> 
>    9430ff34385e ("ARM: dts: at91: sama7g5: add tcb nodes")
> 
> from the at91 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Stephen,

Yes, carry this fix please.
It's handled in arm-soc tree by Arnd and Olof: should not be a problem 
upstream.

Thanks, best regards,
   Nicolas

-- 
Nicolas Ferre
