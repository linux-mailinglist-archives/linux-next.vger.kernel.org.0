Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72231166839
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 21:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgBTUU2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 15:20:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:57350 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgBTUU2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Feb 2020 15:20:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0A90BADB5;
        Thu, 20 Feb 2020 20:20:27 +0000 (UTC)
Date:   Thu, 20 Feb 2020 21:20:19 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20200220202019.GD30404@zn.tnic>
References: <20200221070333.2c89f9c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200221070333.2c89f9c8@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 21, 2020 at 07:03:33AM +1100, Stephen Rothwell wrote:
>   4bcbd6eb7b3c ("x86/split_lock: Enable split lock detection by kernel")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
