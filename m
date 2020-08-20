Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839F724B20C
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 11:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgHTJUS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 05:20:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:55686 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgHTJUP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 05:20:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6DA83B761;
        Thu, 20 Aug 2020 09:20:40 +0000 (UTC)
Date:   Thu, 20 Aug 2020 11:20:12 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200820092012.GC17365@zn.tnic>
References: <20200820161239.25a9b3f4@canb.auug.org.au>
 <20200820082149.GB17365@zn.tnic>
 <20200820191502.1df900be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820191502.1df900be@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey Stephen,

On Thu, Aug 20, 2020 at 07:15:02PM +1000, Stephen Rothwell wrote:
> yeah, I wish people would just generate these lines:
> 
> git log -1 --format='Fixes: %h ("%s")' <commit-id>

Yap, but that "add invalid char" thing can happen when pasting the mail
in the mail client, etc. I've even seen maintainers botch tags...

> Is a shell script OK?

Nah, my script is in python. But no worries, I'll add that to it now,
since I even have an actual example to test it on.

Thx for catching this!

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
