Return-Path: <linux-next+bounces-9285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD265C95B61
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 05:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6812D341D60
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 04:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184581DB122;
	Mon,  1 Dec 2025 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nPvpUVnj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A43BB48
	for <linux-next@vger.kernel.org>; Mon,  1 Dec 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764565147; cv=none; b=pXriUMm8cKZRLqbfzED+/9qW//nC6qbYwZjuXtKdjzSHabAI+EwCI4CxiBVWLh4Q/K1UjOFz4lKxkV4peQn7iL1hCPVrlTjjaktZI3IuhzLr2m69vorGCAr9QXGR7CmPmgx3ZdV3LKFwK4X1xS/N4FFVvQZVmsxZOAo6ZauvP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764565147; c=relaxed/simple;
	bh=+EIwlpBUqsyYbLwByq9NCXfVAaiAP0qKb8xqjgpZl4U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=O8wUsYM4eATEU8tfdAcnTaNBLXixRlEKQ+VG3cAubaaljcaNb42MkY50uHf2Pq//C/STM0J0lDUL+aU0nVlW4TfhYLp8LWponMQ5NFWzGwwJg1BIG0TuHLMfNBrg7WLaOtd8SFTBi6mf5Bzfvj4eloT57fuagZUBoh6acapUKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nPvpUVnj; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bdb6f9561f9so3441885a12.3
        for <linux-next@vger.kernel.org>; Sun, 30 Nov 2025 20:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764565145; x=1765169945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pAnWnIu5S46aH9KnsXkcZMO4/jxhslu/gl8KYWhSqM=;
        b=nPvpUVnj/NSXfc0mRvvOMdOkqo5JordyAZFxO6rj+R2HUNvUzpQTUg7JW2wVaX+jao
         1I/Y2LJ4+eygbizIy3yngRMWTDkkXoue6YZkkebo8+LyyIoxYdhyGfO96WcaUZtaZHLh
         yPK50yn6elMpsX1LCC2F0eIhw37EONXGt0Cp84Vl639kVh/8BSUkHv6CuupXhy3Uv0V1
         9V3yMQcxXSzA7+Z4k3JgBSg7QTwCgBq2QjlRVPnBAwQ/SZHSlVNP6zFS5fJXenaHWX6/
         OtbwD1gTwFUCTdNyUjjLF6lghTnLbg8MdkkanwvguMZ0MlS3O/hDamcyrT9xG+TK9fGa
         70BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764565145; x=1765169945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pAnWnIu5S46aH9KnsXkcZMO4/jxhslu/gl8KYWhSqM=;
        b=hZV0+oaOpZk9WdzAS4XE3dkeUw+aJGxCrUymZ4+B17ynziJ+b1pTeJC/bp5Jo0VRXg
         cLnx2w1qkHGV8crWy52hKnKydepI2SQow9ZRd3ZAEAhHIYyYbu2PLcYTqKk9/X+9gDuw
         OKenZL02vhP++nQO9oNOCJA7gp+UZO0atlIYN1hzwpZzA8WWeaBWWIP+SnyGv6eVpg2w
         njQFUfWKjhnQ9CaaHvSVdKjm21/k+Q3OjSO4Pk0g0AfVTd+DQ8bnGIr4Y/tPqeFGYiuM
         y/+tyWjGAV+2PHRz3+YmPScheqOwVzu0EuWaDhblWZSwCutbMERgI0AHLT39wdGhhyy1
         Q57w==
X-Forwarded-Encrypted: i=1; AJvYcCWIkvl7mqicT8cf0cdmoXbpw3DqjB9B4Ww38ex2te7rSDO8kiC4txcAKvF5ziyDctwqxjamytbIffP9@vger.kernel.org
X-Gm-Message-State: AOJu0YwMlurc/boXsbG0MgrENNVSNHtlBnM4JFvhQNfwUBb3ZA7z8hzI
	4EMJegKRe511Cq2VSJh2vGvnaUUgrjTgLHBrWME/87n9AsexH/almMGtwPHljUmF+uKd6WV1OOE
	ez79v
X-Gm-Gg: ASbGncthFniPeuPww2QOfpVytuQOq/1OeHtWcW/zVoze12o7EdxDsOO91w5PrdJwGG4
	k51ywwYvwx6Dc5CTiN2U+z1xRLWPk9mq67Xju8omjafG7E1uYUkRgaeLb0Ukd7mPYTxZfsWSsKC
	7/2Cs48CZ5ontQaDag65a/m31Rs8sNKkQCnc0a5DfAxkC7JXeIfRB/KQ3rXcP2Oem+z0eaWx0Hi
	JGxKmxzFjtefo3z4YkWY10i1J+RvUpLOYXTBOvUBUUVuV2LWh1UfgOsPgN5dr4bIERHe8iQoPTe
	nu171rSp6wtS8ik59C6vj6yz2y7WjkWBTD+LJpMSIuako3i5eaJECKYr04BPk8tZllyNP8vL3MG
	YRlf5FJqmMKdNGJqUN/+QiqDnuUERI5JsCXrDu8+eMR8FMQXXssGtKsCW87zo+FaF207Tj69KEL
	47AtAl
X-Google-Smtp-Source: AGHT+IGmjx8PrX6KPsHurYpPBqeLlRTCXu1OJva+hUdPeGLMwD0iZbQ70UsIEmmYQmRQk/j61QZqZA==
X-Received: by 2002:a05:7300:5a1d:b0:2a4:3593:969b with SMTP id 5a478bee46e88-2a71927a5a0mr18575760eec.24.1764565144618;
        Sun, 30 Nov 2025 20:59:04 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9655ceb04sm40157011eec.1.2025.11.30.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 20:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmHNldl90aW9fcHJl?=
 =?utf-8?b?c2VudOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVu?=
 =?utf-8?b?Y3Rpb25dIGkuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 01 Dec 2025 04:59:03 -0000
Message-ID: <176456514339.2642.17409010068566138864@1ece3ece63ba>





Hello,

New build issue found on next/master:

---
 ‘sev_tio_present’ defined but not used [-Werror=unused-function] in drivers/crypto/ccp/sev-dev.o (drivers/crypto/ccp/sev-dev.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ce1c65862af14252fd16691d2f1397e0a5827d32
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
- tags: next-20251201

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/crypto/ccp/sev-dev.c:1361:13: error: ‘sev_tio_present’ defined but not used [-Werror=unused-function]
 1361 | static bool sev_tio_present(struct sev_device *sev)
      |             ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/crypto/ccp/tee-dev.o

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-amd-692d0f81f5b8743b1f6e0fde/.config
- dashboard: https://d.kernelci.org/build/maestro:692d0f81f5b8743b1f6e0fde


#kernelci issue maestro:ce1c65862af14252fd16691d2f1397e0a5827d32

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

