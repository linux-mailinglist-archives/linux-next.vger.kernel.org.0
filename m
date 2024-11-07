Return-Path: <linux-next+bounces-4684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DB9C0BC1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 17:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4F3B2392C
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 16:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88632216A20;
	Thu,  7 Nov 2024 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AW1BnTAO"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BB0216437
	for <linux-next@vger.kernel.org>; Thu,  7 Nov 2024 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730997208; cv=none; b=PvbaDTpzTVw5ss81y7D8HmNl1GfOyf4/HTI4mJOAskiTAzsMWzDh/5O+3i2H/Doyauvt8U4XTC7QJ0JzYc8nkaUEooEBicZHYwlV53/QXRnebFToh4kW6dRblJQLgw2P5QWb3xQiA481/ADF0/R4IMkBLTsW8VKMot6EhQD5PeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730997208; c=relaxed/simple;
	bh=plyEQYZsOFD0eahZb07r7fI7T4FMYsCig72lTQm1fF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rz65rcG5pnM385Wz/C1a6ebe/A+zzt5phPrbLiPShhdpqZLtdcRUl3pcdZ9bfpjewH0gpGyd/289BRmJMBKA+6mvFopl3tbSWhvth3egN41AnN1j93mbPDj8X/9flawoBz6dkBN8l9t5Cncow40DC76mnqF9uK5VTbwPcweRuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AW1BnTAO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730997204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zMjkOAXRUweWLYfsCWWeULwPGyQsNWJyMb4kmiUqKYk=;
	b=AW1BnTAOCtV6cazJoWUyHKsSaZBKIrB4cp+yX39AvkCmOQiguERq8DapMwwXSNzAUcGcYq
	jLdpY4uKTM4AlX9OGiVtD21TiojLwegaKd65ZcWnKmpwt8DTxHbve4h5GBbKIBl6Nte76G
	sS7RqrLYsiSnzWI4TOUj5ujEc0CUGcY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-Z7P1yVEXMti1emoDulNUlw-1; Thu,
 07 Nov 2024 11:33:21 -0500
X-MC-Unique: Z7P1yVEXMti1emoDulNUlw-1
X-Mimecast-MFC-AGG-ID: Z7P1yVEXMti1emoDulNUlw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03385195609E;
	Thu,  7 Nov 2024 16:32:54 +0000 (UTC)
Received: from f39.redhat.com (unknown [10.39.192.153])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 231E21953880;
	Thu,  7 Nov 2024 16:32:45 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	tglx@linutronix.de,
	williams@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	jlelli@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	bigeasy@linutronix.de,
	sfr@canb.auug.org.au,
	hpa@zytor.com
Subject: [PATCH v3 0/1] rust: helpers: Avoid raw_spin_lock initialization for PREEMPT_RT
Date: Thu,  7 Nov 2024 17:32:22 +0100
Message-ID: <20241107163223.2092690-1-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hello!

When PREEMPT_RT=y, spin locks are mapped to rt_mutex types, so using
spinlock_check() + __raw_spin_lock_init() to initialize spin locks is
incorrect, and would cause build errors. 

This v3 patch introduces __spin_lock_init() to initialize a spin lock with
lockdep rquired information for PREEMPT_RT builds, and use it in the Rust
helper.

This patch was developed on top of linux-next/master.

As a note, at the time of writing, RUST support for x86_64 depends on
!(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300. Miguel Ojeda
pointed out that this can be avoided with Rust 1.83, to be released in 3
weeks (2024-11-28).

In order to reproduce the problem rust must be available on the system.

  $ make LLVM=1 rustavailable

With CONFIG_PREEMPT_RT=y, CONFIG_RUST=y, and CONFIG_DEBUG_SPINLOCK=y a
x86_64 kernel can be built with

  $ make LLVM=1 -j$(nproc) bzImage 

The problem was reported at least in:
https://lore.kernel.org/oe-kbuild-all/202409251238.vetlgXE9-lkp@intel.com/
https://lore.kernel.org/all/20241107182411.57e2b418@canb.auug.org.au/

Links to v1 and v2 where improvement suggestions were made:
https://lore.kernel.org/all/20241014195253.1704625-1-ezulian@redhat.com/
https://lore.kernel.org/all/20241106211215.2005909-1-ezulian@redhat.com/

Version 2 changes:

- Cleaned up style and incorporated feedback from reviewers Boqun Feng and
  Miguel Ojeda.

Version 3 changes:

- Addressed review comments from Boqun Feng. Improved commit title and
  description and used a proper 'Fixed:' tag.

Thanks,

Eder Zulian (1):
  rust: helpers: Avoid raw_spin_lock initialization for PREEMPT_RT

 include/linux/spinlock_rt.h | 15 +++++++--------
 rust/helpers/spinlock.c     |  8 ++++++--
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.47.0


