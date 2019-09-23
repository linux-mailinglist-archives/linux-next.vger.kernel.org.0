Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B18EBB42F
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2019 14:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbfIWMtG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 08:49:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57228 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730461AbfIWMtG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Sep 2019 08:49:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D10683091755;
        Mon, 23 Sep 2019 12:49:05 +0000 (UTC)
Received: from treble (ovpn-123-153.rdu2.redhat.com [10.10.123.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CED75D717;
        Mon, 23 Sep 2019 12:49:04 +0000 (UTC)
Date:   Mon, 23 Sep 2019 07:49:01 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 18 (objtool)
Message-ID: <20190923124901.3ayejcis5ijrsvbx@treble>
References: <20190918221053.GV2596@sirena.co.uk>
 <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
 <20190923092024.GI2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923092024.GI2349@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 23 Sep 2019 12:49:05 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 23, 2019 at 11:20:24AM +0200, Peter Zijlstra wrote:
> On Wed, Sep 18, 2019 at 09:04:21PM -0700, Randy Dunlap wrote:
> > On 9/18/19 3:10 PM, Mark Brown wrote:
> > > Hi all,
> > > 
> > > Changes since 20190917:
> > > 
> > 
> > on x86_64:
> > 
> > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to gen8_canonical_addr() with UACCESS enabled
> 
> I'm thinking that comes from:
> 
> 				offset = gen8_canonical_addr(offset & ~UPDATE);
> 				if (unlikely(__put_user(offset, &urelocs[r-stack].presumed_offset))) {
> 
> however, per commit 6ae865615fc4 (and 2a418cf3f5f1) the compiler really
> should not be sticking gen8_canonical_addr() after __uaccess_begin().
> 
> /me puzzled...

I think you're looking at the wrong code.  It has user_access_begin/end
around it:

		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
			goto end;

		for (i = 0; i < args->buffer_count; i++) {
			if (!(exec2_list[i].offset & UPDATE))
				continue;

			exec2_list[i].offset =
				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
			unsafe_put_user(exec2_list[i].offset,
					&user_exec_list[i].offset,
					end_user);
		}
end_user:
		user_access_end();


-- 
Josh
