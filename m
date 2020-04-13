Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE711A6136
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 02:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgDMAWv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 20:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDMAWv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 20:22:51 -0400
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF04C0A3BE0;
        Sun, 12 Apr 2020 17:22:51 -0700 (PDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EE0B0AE28;
        Mon, 13 Apr 2020 00:22:49 +0000 (UTC)
Subject: Re: linux-next: manual merge of the realtek tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        "linux-realtek-soc@lists.infradead.org" 
        <linux-realtek-soc@lists.infradead.org>
References: <20200413085034.5e77f236@canb.auug.org.au>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <dbdc1f6b-faf8-7d0d-7730-4ae3f5610dde@suse.de>
Date:   Mon, 13 Apr 2020 02:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200413085034.5e77f236@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Am 13.04.20 um 00:50 schrieb Stephen Rothwell:
> Today's linux-next merge of the realtek tree got a conflict in:
> 
>    MAINTAINERS
> 
> between commit:
> 
>    3b50142d8528 ("MAINTAINERS: sort field names for all entries")
> 
> from Linus' tree and commit:
> 
>    d6656fa4c621 ("ARM: Prepare Realtek RTD1195")
> 
> from the realtek tree.

Already fixed on v5.8/soc but not yet merged into for-next - done now.

Cheers,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
