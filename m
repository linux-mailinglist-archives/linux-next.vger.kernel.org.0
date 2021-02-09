Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C525A314CCD
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 11:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhBIKUB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 05:20:01 -0500
Received: from mx2.suse.de ([195.135.220.15]:54608 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231534AbhBIKRy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 05:17:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6A5C5AE03;
        Tue,  9 Feb 2021 10:17:12 +0000 (UTC)
Date:   Tue, 9 Feb 2021 11:17:13 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 8 (Warning at arch/x86/kernel/irq.c:390)
Message-ID: <20210209101713.GB15909@zn.tnic>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <62fecf7b-e660-8bf6-c9d7-634c599494dd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62fecf7b-e660-8bf6-c9d7-634c599494dd@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 08, 2021 at 07:33:17PM -0800, Randy Dunlap wrote:
> On 2/8/21 4:52 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210205:
> > 
> 
> on x86_64:
> 
> Re: commit 1dba8a9538f5164eb8874eed4c7d6799a3c64963
> Author: Borislav Petkov <bp@suse.de>
> Date:   Thu Jan 7 13:29:05 2021 +0100
>     thermal: Move therm_throt there from x86/mce

That one is replaced with a better variant now and it should land in the
next linux-next, the one after next-20210208.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
