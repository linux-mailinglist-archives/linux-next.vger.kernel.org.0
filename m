Return-Path: <linux-next+bounces-7883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F38B1F3C6
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 11:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 074BC3A0159
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 09:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3412F1E8326;
	Sat,  9 Aug 2025 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="1F16SOcH"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D241E5B60
	for <linux-next@vger.kernel.org>; Sat,  9 Aug 2025 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754732213; cv=none; b=QBTgpn+ik9C0pNbvOTEML/iR8clwPMtOAMZ6wC1vwMmyDGC0xK24z9vbD5fU22Zd7CPPKM+8K6RFMY1Q3+dwWUR1hof2oKbrTFC3fZLzA8c+gtSHy4b1NZ0FG3E4HcvJND3GmjjpmAMZok33NnXDK5fMztymB3b6KSrSp5qiU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754732213; c=relaxed/simple;
	bh=f5dgPPG9le6xdnqPlDxBZlo/VDpc1tcDEgs8EHRupsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN/NaRl2sU9eNE4ueInGgn5LQaUaUi7P6nu5jD2zV56v1CI/M/e0bRjOwJjYjJ/SGVR5hhTJpEwk6nJuLrXnbcbFrwEekgQes97oDbyC6u3kgEk0q6Bhi3pGH5mosWdiFlT++Ii97igoEsQ0iygvmbyFEI+zzB8Z2b6XubD7Fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=1F16SOcH; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bzbQ65D7Kz9tDX;
	Sat,  9 Aug 2025 11:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754732206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qKLEcwImtnKbD3bvBMrqDUfNNLWPYRNY9MbQe4li21U=;
	b=1F16SOcHpl4/LfH/j3zeeDIX7kYnoMu8w8oDEK/wUJ/9LDq2JH76XmMiLtYg2To4gtfing
	1MfvTXMNepDW3YAPnNDAa30VQnoH4aVx8BXSkZVdnnAikW/atqdx0r88rm8yRZMIc+zoWu
	g19p4/nMSLbPTqcUAeP3DlZDxDv+ip0+PSXHhfJcRlo3a2vQ0paIf1+JiqAUYbZ5VByAxY
	c+kOnhMcXuUks6vypf4AMAtUH5tVVRXMdz9BU1ngtSk0NcoK5UGHyuC55tRYlXZ3MJu5Kb
	1whGfoGp//C9fpIjhtqwGqFW7v+5eFS2WyF4UQ6svCUdM5oT1X+nHwv0uugxyQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=listout@listout.xyz
Date: Sat, 9 Aug 2025 15:06:35 +0530
From: Brahmajit Das <listout@listout.xyz>
To: linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
	airlied@redhat.com
Subject: Re: drm/radeon/r600_cs: Build failures with GCC 16
Message-ID: <smpcrwsua5kwutn5ynzz4eiupocvw5c7b4tmk3xugynvmnr53d@zxyraythnybm>
References: <pqpvdwxmqler2mg4ou665v56g6qe36vwi5jeavqeszj2mrk5m7@io6dy7jsvuhe>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pqpvdwxmqler2mg4ou665v56g6qe36vwi5jeavqeszj2mrk5m7@io6dy7jsvuhe>
X-Rspamd-Queue-Id: 4bzbQ65D7Kz9tDX

On 09.08.2025 04:45, Brahmajit Das wrote:
> Hello Developers,
> 
> Building linux-next with GCC 16 results in this following build error
> 
> $ make
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC      drivers/gpu/drm/radeon/r600_cs.o
> drivers/gpu/drm/radeon/r600_cs.c: In function ‘r600_texture_size’:
> drivers/gpu/drm/radeon/r600_cs.c:1411:29: error: variable ‘level’ set but not used [-Werror=unused-but-set-variable=]
>  1411 |         unsigned offset, i, level;
>       |                             ^~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/radeon/r600_cs.o] Error 1
> make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/radeon] Error 2
> make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
> make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
> make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
> make[1]: *** [/home/listout/linux/Makefile:2011: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> I'm not sure whether this is kernel bug or GCC bug at the moment. But
> building with GCC 15 does not give this error, hence I'm more inclined
> towards the latter.
> Planning to also report this on GCC side, wanted to get some
> opinion/feedback from kernel devs as well.
> I'm on GCC 16.0.0_p2025080.
> 
> -- 
> Regards,
> listout

After giving a more thorough look, the level usage seems like dead code?
It's just set (level = blevel) and incremented in the loop (level++). I
don't see any other usage of the level variable. So if we do something
like

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index ac77d1246b94..953ce0c57dfb 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -1408,7 +1408,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
 			      unsigned block_align, unsigned height_align, unsigned base_align,
 			      unsigned *l0_size, unsigned *mipmap_size)
 {
-	unsigned offset, i, level;
+	unsigned offset, i;
 	unsigned width, height, depth, size;
 	unsigned blocksize;
 	unsigned nbx, nby;
@@ -1420,7 +1420,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
 	w0 = r600_mip_minify(w0, 0);
 	h0 = r600_mip_minify(h0, 0);
 	d0 = r600_mip_minify(d0, 0);
-	for(i = 0, offset = 0, level = blevel; i < nlevels; i++, level++) {
+	for(i = 0, offset = 0; i < nlevels; i++) {
 		width = r600_mip_minify(w0, i);
 		nbx = r600_fmt_get_nblocksx(format, width);

I think it should be fine.

Would really appreciate some feedback.
(CC-ed Dave)

-- 
Regards,
listout

