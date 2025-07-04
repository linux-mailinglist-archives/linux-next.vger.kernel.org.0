Return-Path: <linux-next+bounces-7364-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC9AF91F4
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 13:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02A761C4294E
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 11:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813921FC3;
	Fri,  4 Jul 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uX4HBLEe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C312BE7B5
	for <linux-next@vger.kernel.org>; Fri,  4 Jul 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630347; cv=none; b=bVZ0aYHUHje4WoX93xsNlQuttTZLtszIwOEQlhNojOdVzr8YydxwxZEhTqrahTmLFC3ogNlzVxX+ocqMIQrsH7FDrf+L7aLDlxtyiDA6sg784dclD87mqWxQWcLGeUjuoxicjEyJgR7vAlj9wWMKP8wsds+MUti1PzuWihx6qsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630347; c=relaxed/simple;
	bh=2Y6Or+M86IdLESd07gNvHYCL8FyjBcmjGfFoeNmRqkw=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=HguxC2Xb2Iwes3dObEKKaN0YdYe/c/SOf0tQJmwIYe6MDZ7S3/sE/PDiGpvTfaHK2jyavpLY16GeIOUaFX9up2pqyJqv3ufptSucrVBMXbTDojniW+YIMLqfUeqVTn0ecJtBgPBu0DDTvRrQw4lCYLZJMK4FVIK0mQ+FHG6LZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uX4HBLEe; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e40e3f316so6302537b3.0
        for <linux-next@vger.kernel.org>; Fri, 04 Jul 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1751630344; x=1752235144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QPyMWfcH5a3vIyqq+fjaezA7nXkC1s79HdwkjMy0bg=;
        b=uX4HBLEeZilK9/4QVgutWmG+3ezfM1QA/yjRagUw/ZfZrMdRo8z9x09NfTaQlWIG1n
         CvI9mCUKcmy4/bwslY9x1zjApV07xq9KV7ojhG+Vq/alOV4tm7cRWFKArg7j06eLl7bW
         +4lNuj7BtlI3FboNsai2dv01chr58xt86HdrXvwC6Im3Q1/mHWD5LHKsGt5Evxkz/By0
         IDcDSr7kr43Ux2CIc4/rg6qZh0WVleXVp3oc+g5udomTiOdDvVJvtAypMnjDm7ZlehBJ
         C1UvlR8m9FtgXcmzzT9TlsBkbyIhsnfjtyI6DZtfLKEJSWIZnd060jbVXD+R0/aKRzG9
         K9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630344; x=1752235144;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QPyMWfcH5a3vIyqq+fjaezA7nXkC1s79HdwkjMy0bg=;
        b=ScAOuDEPBTbZrKRlQe0bCaDzeyaDjVgpFzNjPrSD6HHzNDFvSk7+0NLH0t65AJj7cN
         pc3MoxJv3SIi7NKmIURoWkCddLPEchJ3iiOQ/JxPjVFRlJikpmmZx4y9CboSZ1U3dD66
         tjhtpjjiWZfEylIOo5u1W2qBUt/9gejFBUEgPQD1j9SZgZmG4AirAUErJqko2UVcjYo9
         oWTv8uaGxZJdd3vK75uKTIynafFlFrblHZmPmeYXrXjSTX/F19VSATcHsNc7RMB2KoF5
         QJLRYb8Lp94GmYQbq4cvtjb3cWrmyfl64Yn35gIFtBBwJLut8Rz22leipQw1rpnNgJWn
         4DIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/KEE3uy+6pDjZbIV4x0d1RcQTqR/WivhgdHPL67XWlvLWo4fYjk9MKfGZh0O9bzQb3BTCbVGxjuBz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4B+6+PQL+/j1oCtsl+Y7E6ZnleANjCLeYMPvGdZ9CAP8hz9td
	kGTZvi3FOD4VNic+TvVJ6a0v9MpyDdhC9LuflJUHC0BbYqolFMNAvhKUIsAClq99bFerQuvFpNF
	AIluYJ38lzXQ+QvPpItu6sWdNkWXYeflMsY2TU9yq0g==
X-Gm-Gg: ASbGnct2EYCrNSGSKx6foy8Qq6N6e9JT2uaMnc274xnq5CFC+maWskjusups+h/OmAa
	B0QJsUbMtp7N6f2A9tsILfGkKealYyD9KN9Xw6a3h9MCUEVzfUfFrXv9mv2U3auu8Qe7SU19p5K
	9dHnlLuWm4BfsFUe/IaZBnA3lFHnnqSRmUIvO5Ga2FdA==
X-Google-Smtp-Source: AGHT+IH55A+FpRtVTsxcL2s6ZUjKccEAMQC/IIfj5Rkv/Wk93wVwmhRg9pMTwu/+TfuY2JpJXBWdCN0goNe0wCr0614=
X-Received: by 2002:a05:690c:4902:b0:70e:16a3:ce92 with SMTP id
 00721157ae682-7166b6cd929mr19042967b3.17.1751630344225; Fri, 04 Jul 2025
 04:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jul 2025 04:59:03 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 4 Jul 2025 04:59:03 -0700
X-Gm-Features: Ac12FXxc8vEKmVKNvsp3LWo-wEYC5PTDz35RunsmdZrBe4jA1S5b0eYDhX0Noe8
Message-ID: <CACo-S-16Ry4Gn33k4zygRKwjE116h1t--DSqJpQfodeVb0ssGA@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) cast to pointer from integer of
 different size [-Werror=int-to-poi...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 cast to pointer from integer of different size
[-Werror=int-to-pointer-cast] in kernel/bpf/stream.o
(kernel/bpf/stream.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8c418e432e074dbad60dd7a8c9656044427b1807
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  26ffb3d6f02cd0935fb9fa3db897767beee1cb2a


Log excerpt:
=====================================================
kernel/bpf/stream.c:501:53: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
  501 |                                                     (void
*)ip, line, file, num);
      |                                                     ^
kernel/bpf/stream.c:505:64: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
  505 |         ctxp->err = bpf_stream_stage_printk(ctxp->ss, "%pS\n",
(void *)ip);
      |                                                                ^
  CC      net/sched/act_api.o
  CC      fs/nfs/nfstrace.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## i386_defconfig+kselftest on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:6867b3065c2cf250420083b1


#kernelci issue maestro:8c418e432e074dbad60dd7a8c9656044427b1807

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

