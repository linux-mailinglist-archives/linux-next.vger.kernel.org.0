Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B86BB677
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2019 16:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbfIWORB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 10:17:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23103 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730669AbfIWORA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Sep 2019 10:17:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 88F1E7F74C;
        Mon, 23 Sep 2019 14:17:00 +0000 (UTC)
Received: from treble (ovpn-123-153.rdu2.redhat.com [10.10.123.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C6B1960166;
        Mon, 23 Sep 2019 14:16:59 +0000 (UTC)
Date:   Mon, 23 Sep 2019 09:16:57 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 18 (objtool)
Message-ID: <20190923141657.p6kpqro3q4p4umwi@treble>
References: <20190918221053.GV2596@sirena.co.uk>
 <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
 <20190923092024.GI2349@hirez.programming.kicks-ass.net>
 <20190923124901.3ayejcis5ijrsvbx@treble>
 <20190923133352.GI2332@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923133352.GI2332@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Mon, 23 Sep 2019 14:17:00 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 23, 2019 at 03:33:52PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 23, 2019 at 07:49:01AM -0500, Josh Poimboeuf wrote:
> > On Mon, Sep 23, 2019 at 11:20:24AM +0200, Peter Zijlstra wrote:
> > > On Wed, Sep 18, 2019 at 09:04:21PM -0700, Randy Dunlap wrote:
> > > > On 9/18/19 3:10 PM, Mark Brown wrote:
> > > > > Hi all,
> > > > > 
> > > > > Changes since 20190917:
> > > > > 
> > > > 
> > > > on x86_64:
> > > > 
> > > > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to gen8_canonical_addr() with UACCESS enabled
> > > 
> > > I'm thinking that comes from:
> > > 
> > > 				offset = gen8_canonical_addr(offset & ~UPDATE);
> > > 				if (unlikely(__put_user(offset, &urelocs[r-stack].presumed_offset))) {
> > > 
> > > however, per commit 6ae865615fc4 (and 2a418cf3f5f1) the compiler really
> > > should not be sticking gen8_canonical_addr() after __uaccess_begin().
> > > 
> > > /me puzzled...
> > 
> > I think you're looking at the wrong code.  It has user_access_begin/end
> > around it:
> > 
> > 		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
> > 			goto end;
> > 
> > 		for (i = 0; i < args->buffer_count; i++) {
> > 			if (!(exec2_list[i].offset & UPDATE))
> > 				continue;
> > 
> > 			exec2_list[i].offset =
> > 				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
> > 			unsafe_put_user(exec2_list[i].offset,
> > 					&user_exec_list[i].offset,
> > 					end_user);
> > 		}
> > end_user:
> > 		user_access_end();
> > 
> 
> Oh, Duh... Yeah, so the alternative to your solution is to do 2 loops.
> Not sure which would be better.

I like your idea better, makes the fix more localized and shrinks the
uaccess window.  Something like so (not even compile tested):

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b5f6937369ea..406af374f728 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2847,6 +2847,11 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			u64_to_user_ptr(args->buffers_ptr);
 		unsigned int i;
 
+		for (i = 0; i < args->buffer_count; i++) {
+			exec2_list[i].offset =
+				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
+		}
+
 		/* Copy the new buffer offsets back to the user's exec list. */
 		/*
 		 * Note: count * sizeof(*user_exec_list) does not overflow,
@@ -2862,8 +2867,6 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			if (!(exec2_list[i].offset & UPDATE))
 				continue;
 
-			exec2_list[i].offset =
-				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
 			unsafe_put_user(exec2_list[i].offset,
 					&user_exec_list[i].offset,
 					end_user);
