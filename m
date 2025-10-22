Return-Path: <linux-next+bounces-8678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552DDBFA039
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 06:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9503B59DB
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 04:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864A52D8DB8;
	Wed, 22 Oct 2025 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0h0cVpCF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6442D9481
	for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761109147; cv=none; b=cm8nzPqSZJYdllY4CPWHTPIeJStxJtkhdYDLVi4kmoOZO+kNre5Vw6Cg9eV83b7glGZtJBPi6mO/X+e41Mywx2GdVtdfpUST9ot8yjbBQ/vLyqgtW3OWb5dSY0HqH7VDmhdLfXuGuc1OkQtqKEQcIs4LeIfKc8NxkFzs1I2iEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761109147; c=relaxed/simple;
	bh=KhqM1NrT/8XQgZX2oLYZnYQtiWE7ZB8lY5Pxm0UGfrs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MqMAN5dSQDebpmX5gZretNd/Wg/Fa3W05m9t3+BG0csKIr5+lk7cwxL0GnB/i3zw8tpmlAbWuZa2G3KhRCyJg0/cgSh5fzjIrnXmcjKQXEt9y5m8iAfEj/MfVURJjbsthI1gtRb6DWGejjqrNRtwIrh7UQjR1RelmMu4ABd/8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0h0cVpCF; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33ba37b3ff7so642448a91.1
        for <linux-next@vger.kernel.org>; Tue, 21 Oct 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761109145; x=1761713945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XljzsX8rFdvLVOxvx3w7VqFqu1GNuTKVNMAlBz/xv0A=;
        b=0h0cVpCF8HjaMwp0Ur3AAZ+gYsEMHQlRrAJdPvP/tWDa2KsVjpCxvv7oM/Nfu/uqTl
         93rycagcUwuT1MDH4f2aiKUQZzrSmLWbtoVf+YwIzIkFgWnfaDIUkyPNrCLCjS0bvasX
         1s0RmBAEW3dIfCMFk0RoNhXCk95OAWbxPPQ5TjxSUpHY/xzzolyET85EIou9ywL1+Poj
         ry3ATqiQUPU9ZvoyhH8p5lYZraMVBkv/kd+VQOBpFpuEtsKuckg/dlRLoq9izrtW7iGH
         k+bNm6Sq9l9SB+tbUHEGHqxHBgQoEMzfskM6S61GEbmP4nk2v5pM09YyCSkpJopWF/u4
         BquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109145; x=1761713945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XljzsX8rFdvLVOxvx3w7VqFqu1GNuTKVNMAlBz/xv0A=;
        b=c2+tZ/+axVrDbqx8itAgTwWpH8FQfSdHjao1A6MDZfJYnbNxKVfsUxPwEbX4T0ZF1f
         DcydNN3APWtOQmOMmQCu3IlOCb1C2iBSr9ahR8h1UR+3x1YnTH95yWkj5oWV12meT/go
         pCw8b6XyNcSe8vuRrNAkrN+f7FPHQVOxZ7T0X7q66Uq+AtDlk4mWxtWTo4D9B6A1UOOj
         9T/1Q5X96mRjuKN70ZZ2p1U2WOpDeUHZfiOzS33r4UhXgFybK0rzbbJmprKdUE7IA0XW
         QTvI3SOuAeyCVU27d3U2d9GFLse4yB5+QqOYY1ztvfmxEkzHMrF8bOtc2wXF+uscgm8k
         SUkg==
X-Forwarded-Encrypted: i=1; AJvYcCXZrkfjnknUoeruA/xXwyiR86DbI3SxUCa7lSlkgOMNRLd358Ft2lsjmqvnLbxp4QqLsSoHEjtToOSC@vger.kernel.org
X-Gm-Message-State: AOJu0YyV961gwio15e6Ca9yOeJ3AQ84mVfgItsSvLvk9oSNEIq9h06a/
	+G/F8eMIoW4vLeiuwRUmMNelF9ZEPpWkRIt/sN6pq04fl8Os8OcY+Du8hrF9I74wvHk=
X-Gm-Gg: ASbGncsn8eVcPomjdnlIMl0dDMIg3FKtYbbjaVfwxhmzh8qxwNUObPN4JX+Pdwy/0PW
	+q4p9AZQapPfdRZ83BwQ1lJrlrRVfxOXLX7HOKhdrkO7XZsgrBAjoSobaLwb76a/zcvo0zM2LiA
	OzuR1xBKvGd6Acjyp/Pifxz5HBbWf+81u10iWLSctdp+rB8WlvTFxYWy3Ex/SklfXwpe5O6qO6M
	anT2yFiv9O18RRanvdHgokLHl6L3mieXJ0fBudPyMvCS9vjFXFiRANcP9PtE985wgIj7N765slv
	bxk47iCrFI6uuSQyj7VolVdmz0fvluHeLoVE0ef6gCVwA9Sd0VgRp5Iq5McmFFU0kvIsRKP6l2X
	aUJkl/3x24vAViF9dK8bhTXoCFjkGK/bOJwTcknNye1WLqF8K9SxfF7hMK45NwB/sUvJj1A==
X-Google-Smtp-Source: AGHT+IGGrOExh+SSr7Xifn+Bg1nCtg/cwiq7wtsYAbA6u+ujfGROcYrCEOCfEz0xmUMPv0o2MclUSg==
X-Received: by 2002:a17:90b:1e42:b0:33b:dff1:5f44 with SMTP id 98e67ed59e1d1-33e905eed0fmr181531a91.6.1761109144734;
        Tue, 21 Oct 2025 21:59:04 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010e25asm13084992b3a.56.2025.10.21.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'sqe' is uninitialized
 when used
 here [-Werror,-Wuninitia...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 22 Oct 2025 04:59:03 -0000
Message-ID: <176110914348.5309.724397608932251368@15dd6324cc71>





Hello,

New build issue found on next/master:

---
 variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized] in io_uring/fdinfo.o (io_uring/fdinfo.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:764471d48b9e1faab06d96f79a325cdcf2a995b7
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  aaa9c3550b60d6259d6ea8b1175ade8d1242444e
- tags: next-20251022


Log excerpt:
=====================================================
io_uring/fdinfo.c:103:22: error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]
  103 |                 opcode = READ_ONCE(sqe->opcode);
      |                                    ^~~
./include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
        AR      drivers/irqchip/built-in.a
|                     ^
./include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
io_uring/fdinfo.c:92:27: note: initialize the variable 'sqe' to silence this warning
   92 |                 struct io_uring_sqe *sqe;
      |                                         ^
      |                                          = NULL
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-x86-68f854869533132a189705c5/.config
- dashboard: https://d.kernelci.org/build/maestro:68f854869533132a189705c5


#kernelci issue maestro:764471d48b9e1faab06d96f79a325cdcf2a995b7

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

