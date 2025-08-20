Return-Path: <linux-next+bounces-8034-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F3B2D9F4
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 12:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 197B85A4434
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89699475;
	Wed, 20 Aug 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eLa6SqgY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278626CE02
	for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685356; cv=none; b=Qox6k1DV8PHQCMlQL4F65KDHGqPu00L4PAOQPjuUXuGYyHQSvtL5T33VdrpU08bPgp4K0FlXaL5wPW7biNSz2QjteNHrRwYqraaGagonaMda8Br3g1Gw235h3dmKMAvUsu/vwJfQo7FORFRQ8i7JIKBljKla81CgrJQUSBbNuEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685356; c=relaxed/simple;
	bh=ekhlH+QB646C4gZDJ1lIVyG5Q3h6WGkTJkLYrfK8lzo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=uCvJZr9+Yh++BGx3OLEhIpO4MQ1UBy8mfKLsG8tZ5CvqjzWorkeYE+w668bScg/7JI4E702B02bnrqYKIM/xfvLzmbs3/PPbXbfGv3tmiMth51E2B4yob68C1FwfJQi6AM9jiPxcAeM2aEiGDnl+r9xSUj/pu4YCcRmsNWf6sx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eLa6SqgY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445824dc27so59189235ad.3
        for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755685354; x=1756290154; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=;
        b=eLa6SqgYt7viNvC4GHBudh/D3xz2+5TKEUmvdepbOB14Q90LHQv70vnAFEiCo1dRPz
         6jHPBuvp1DFb/VffkjzfJhrd49mYu9YzBM6xsSVYKw5IC2dS1s0c3oViQ5vpvG8w0f1Z
         rJnYJtYdBEne7Y53aYhOg96ZbiiDPqv7GBB4l127FcxmnbP9WhCUfRIGiUoPUB5TQ952
         8S49yBe4NnhQncrfdOUzuGSif1iFj/frsi5UiB57rEcZXm8jeyXjM6gFZuw7sAwFMNui
         6lBQTpY/gJlMy2YQKwtBQZDh9NfbNjLNIQk2Cx7ZFDTYsuuF+vhg0xagawMtBfZdccNw
         sBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685354; x=1756290154;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=;
        b=ACmHRJc23elO49bZOUidCPVaTLkPpQMJVRmQHwHH8FrJleT+EB6UpVfkzOqwPd2AtJ
         3gJV2ut7HYilDClbfSoTYoRTNOyJSJBpdi9dMlyCXIp3KRd/5QnflOjYGomXYo926kRf
         92w+1VIv+ADqe5Mleiv6guf0ykRKHfMH9I2DRoKXHnI1Wh6ihMKxGIJJEQmjgasGrIpL
         0wbRhj7Guj335I2PeSnk/HXSxM+eR3K+OF8YPI6kjj9awmPHLJFB0jkxt9NXY3tE+91h
         h+6oBenlhgup+NSIWjs8x3GFCRH5m/qR2lbetybwf6ko9h7LPXQx3WleIlCDW9oy5OHh
         lMPA==
X-Forwarded-Encrypted: i=1; AJvYcCVbE8wqdZS8pZJHfoy7Jujj0ns1ALx5XNR+rRAElR904QnnZnQIEljeoWBqsvozaG6Vt9Bbx471A/+f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzj67h1z5VN429Ale1fXZ9LPPABnIYaK5Hg4EVgu7gHfL1rKkG
	rLHhWCL6T1BHTWCUlTeNLi3DrQlBfOM3/cg3S5u83aGKtVw6PMAq+XHqsmMz2hg0y24=
X-Gm-Gg: ASbGnct3Mxu/htjhsC1Vk39+X3wMq9shG6JEd5RXywwHROjTmKcRpxk1wlTHY3C8CjC
	5dRMjPKfA64ktmRujx2eFRLkCuY6ojAVLTcvE+/K74NyJngvZEe74YYjaMunsggSiB0jmTPiO6I
	9FJ4RXoVYUO7lYUNvFVxzTvWbbWd+1B7OrDfSK9Dwg3MggHfDEOEyJvzoQ0Mo5rq+VXKNgeu/i0
	gs4nZqFHoYTZC1gXdhbBkPmG2+QFvVNEqvlqQZQ1hfqkrR4C5u0dKxdXvbTbPhJkiGZ+EX7Rutj
	RqnqLct+W+WXdbH6Menp4ZBgST9Knh/P2N7NnbMW8+oxryZ5DbdmjwXl6dugBV3k29AkYnavFOq
	ZksHFaWueOHn6k8u859PUTog/
X-Google-Smtp-Source: AGHT+IHC1vhZMOE2tywrBCJNFfsWMse4MPwivKurQqxzCX6JevJiyFpMEeYsHEkpnp2GH2btUtaT+A==
X-Received: by 2002:a17:903:287:b0:240:3d9c:6340 with SMTP id d9443c01a7336-245ef11b097mr25715015ad.20.1755685354013;
        Wed, 20 Aug 2025 03:22:34 -0700 (PDT)
Received: from poutine ([2804:1b3:a702:7d26:1577:2536:a82d:763b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e5c1sm22062005ad.161.2025.08.20.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:22:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (boot) sleeping function called from
 invalid context
 at kernel/locking/rw...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 Aug 2025 10:22:31 -0000
Message-ID: <175568535010.3222387.7351336690916179632@poutine>






Hello,

New boot regression found on next/master:

---
 sleeping function called from invalid context at kernel/locking/rwsem.c:1589 [logspec:generic_linux_boot,linux.kernel.bug]
---

- dashboard: https://d.kernelci.org/i/maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  5303936d609e09665deda94eaedf26a0e5c3a087
- tags: next-20250820


Log excerpt:
=====================================================

=====================================================


# Hardware platforms affected:

## mt8186-corsola-steelix-sku131072
- dashboard: https://d.kernelci.org/test/maestro:68a572e9233e484a3fa2c0db
- compatibles: google,steelix-sku131072 | google,steelix
- 1 fails since 2025-08-20 07:25 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a429e6233e484a3fa0aba6
    - on 2025-08-19 07:38 UTC
    - commit hash:  886e5e7b0432360842303d587bb4a65d10741ae8
    - test id:  maestro:68a429e6233e484a3fa0aba6

## mt8195-cherry-tomato-r2
- dashboard: https://d.kernelci.org/test/maestro:68a572ea233e484a3fa2c0e1
- compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
- 1 fails since 2025-08-20 07:25 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a2ce76233e484a3f9e5dcc
    - on 2025-08-18 06:55 UTC
    - commit hash:  3ac864c2d9bb8608ee236e89bf561811613abfce
    - test id:  maestro:68a2ce76233e484a3f9e5dcc


#kernelci issue maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

