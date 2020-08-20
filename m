Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1046924B24E
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 11:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgHTJ1H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 05:27:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:59310 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727866AbgHTJ0N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 05:26:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 11E3EAC7D;
        Thu, 20 Aug 2020 09:26:39 +0000 (UTC)
Date:   Thu, 20 Aug 2020 11:26:11 +0200
From:   Borislav Petkov <bp@suse.de>
To:     David Sterba <dsterba@suse.cz>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200820092611.GD17365@zn.tnic>
References: <20200820161239.25a9b3f4@canb.auug.org.au>
 <20200820082149.GB17365@zn.tnic>
 <20200820191502.1df900be@canb.auug.org.au>
 <20200820092221.GU2026@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820092221.GU2026@twin.jikos.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 20, 2020 at 11:22:21AM +0200, David Sterba wrote:
> (Dunno why not an alias but it works the same way.)

I have this alias:

	one = show -s --pretty='format:%h (\"%s\")'

and so I do

$ git one <sha1>

and then paste it after Fixes:

I have it this way because quoting commits is kinda very frequent
operation, not only for Fixes: tags.

:-)

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
