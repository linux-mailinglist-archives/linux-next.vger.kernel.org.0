Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCD0B7F65
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 18:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732544AbfISQvX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 12:51:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33680 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfISQvW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Sep 2019 12:51:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B938530860CF;
        Thu, 19 Sep 2019 16:51:22 +0000 (UTC)
Received: from treble (ovpn-123-153.rdu2.redhat.com [10.10.123.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CE751001B00;
        Thu, 19 Sep 2019 16:51:21 +0000 (UTC)
Date:   Thu, 19 Sep 2019 11:51:18 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Sep 18 (objtool)
Message-ID: <20190919165118.lffzvrl5efbpnvux@treble>
References: <20190918221053.GV2596@sirena.co.uk>
 <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 19 Sep 2019 16:51:22 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 18, 2019 at 09:04:21PM -0700, Randy Dunlap wrote:
> On 9/18/19 3:10 PM, Mark Brown wrote:
> > Hi all,
> > 
> > Changes since 20190917:
> > 
> 
> on x86_64:
> 
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to gen8_canonical_addr() with UACCESS enabled
> 
> using
> > gcc --version
> gcc (SUSE Linux) 7.4.1 20190424 [gcc-7-branch revision 270538]
> 
> .o and .config files are attached.

Does this fix it?

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b5f6937369ea..7e111cb5b14b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -284,7 +284,7 @@ struct i915_execbuffer {
  * canonical form [63:48] == [47]."
  */
 #define GEN8_HIGH_ADDRESS_BIT 47
-static inline u64 gen8_canonical_addr(u64 address)
+static __always_inline u64 gen8_canonical_addr(u64 address)
 {
 	return sign_extend64(address, GEN8_HIGH_ADDRESS_BIT);
 }

-- 
Josh
