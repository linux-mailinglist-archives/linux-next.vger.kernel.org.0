Return-Path: <linux-next+bounces-4483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B99B2EB3
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 12:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311EA2845B6
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 11:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636F71DDC2A;
	Mon, 28 Oct 2024 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7iQhJO+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040E1D61A2;
	Mon, 28 Oct 2024 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114225; cv=none; b=fQ/QBj6xTwsBHuWrEIwQNyKvQyrEjqkxs4I3pqQmbgnxKMfLiJVb/ybUNYdGbySwwxbsWOgJSZc4YReoDPtDkxjpm3O1SE50x5+KPEBwUXqlFZ4fR1rLX8A/H1Ml7iDmCfhWJ1AXOQzGuzDCPEKtsiGSXyYcwQPlr7/WTPcA4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114225; c=relaxed/simple;
	bh=Mxx597M/sVwtRXKyXQ3t/slPbGemI4c1oBODxSYTCAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hlZdehutrBqDNzH3C50M49NGo/Y+GjvMoj4GAUPpSclQcBFVUREgNPMmYIt+2Z/v6DDoY6GsSGzDx5OOKAukNEKf77PnPxTZ2Q0845iy3DspTcP3lu33HJbQLrp4XKX8zvD7xoPaPww6043zAWI3+mAYM6bYMPodmxvM0mCDV7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7iQhJO+; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so3053051b3a.3;
        Mon, 28 Oct 2024 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730114223; x=1730719023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORjMty/TkXC30xWgYYYlVcOJ2nYVBxh1DhXJWSe7Un8=;
        b=I7iQhJO++w1/FqCCtuO5QJmrbGzXus6voTUwwGldtYDU4W0p0VAOIsyAhUpjmcFvXv
         WVUEn32MkgTIoOlbbDvr6+yNL52Hd4f8uLMkHqNlBLPU+WhX3YLcq8Vv/rInBiYU6Nsr
         c7S6pILIHwhYcz5TMP9ZOyzmfZ7NmIUKIJ5meYNxYTMqapkBAI6Fqh1LTyq9d1AwY7PR
         RJE/SqTXGShnskYcGgIpm3zndvbQAzhlIqQJ5FJRTjOkiTEhbem4UJ6DYWfriW3Yqn4r
         /u4I/Df62OCHYj3sbugI+yTMLZX0Z2ANlKB9NAQdxCVbaT7zBm5X3n/QJjZ0K4FQod7Q
         pslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114223; x=1730719023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORjMty/TkXC30xWgYYYlVcOJ2nYVBxh1DhXJWSe7Un8=;
        b=pUmTCBU5/kOP6fUOXV+9fiFlomJgrLbo45AO4aEtzoGCWhDbpCXBMMn7irWDlVObEh
         chde6lXXllPs365u/VBMHS5DckomRS7C3N0JX1s6kx1d6rO5//55qlDBia8U26VxRCQy
         q95GeUAbcCtDwvnhZy7m+gpKjM6Gn8tteQGzSX++OJi/PDk0yVH9wR+K/NxjqaxToE9T
         t2avX848NUpHWu0mjR0mJG8i5QAHICI24+Inos09CzFXJBFe3NX5HseA/wQhSNQQAtFF
         w6M7d4SDTSWqNdbK7ZUue7UhP6h4Q2HV8c0od1urPxTb16Se1K6c4F29Mzb2DSRzDQFT
         VClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYT1yt/6Q/+b6XDTTX9TS/Gaay9v14bTxIahDud88bEuV2r6LrhepxgC+29hAfkvwdS04DykSabO4BA1A=@vger.kernel.org, AJvYcCV+6dDjtiB+pvGd1VD09bPcUEk3HDHHJYWneD1FJKmxEbpEq7YLtyA2F0joNvl0KVOV4H3SYqJdgRPmaw==@vger.kernel.org, AJvYcCWPg8QFNfxwEv8T2HQDqzMHKdSRtN5YSKdw7mRiohi1cAVxHWhKxx5nW68iHPicFhY1v9nz8j8CmNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhqCivElHwRQ32qidoH6IVD1dcKV/LI2CWcqbEuiR2qfEzjzDK
	0KQZBnEYhodzT8CZdKgg3fUEWlgm5pr6uUvS3AcazTRkHOkWiMwd
X-Google-Smtp-Source: AGHT+IEs3xJO2VaS6OLu/ZG4EsgKrQMwterQHy96fotP+n8dGvJPA95DEczzR1ej4HZ3Rlo8vkQqpg==
X-Received: by 2002:a05:6a00:9286:b0:71e:db72:3c87 with SMTP id d2e1a72fcca58-7206306effemr9510452b3a.20.1730114222596;
        Mon, 28 Oct 2024 04:17:02 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72083fee549sm1107848b3a.106.2024.10.28.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:17:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C2E0F4207D11; Mon, 28 Oct 2024 18:16:57 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Sound System <linux-sound@vger.kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] Documentation fixes for ALSA Co-processor Acceleration API
Date: Mon, 28 Oct 2024 18:16:45 +0700
Message-ID: <20241028111647.17378-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; i=bagasdotme@gmail.com; h=from:subject; bh=Mxx597M/sVwtRXKyXQ3t/slPbGemI4c1oBODxSYTCAE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDOnyhYt+6iSZGfYern2XkGP2yPJY1azL75fvVfk+pblwu btDQMXRjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEykoY6R4enETRyH9qVcPHNy 071ZdZeWqbvL/O3751st686r87Te3Yjhn+7tv/sLVPPOhT/zfZyxdsXzlpgz68p8fZgfsrBP9tv KygIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

A small (two-patches) series fixing htmldocs warnings on sound tree that
first being noticed in linux-next integration [1].

[1]: https://lore.kernel.org/linux-next/20241028193242.11597640@canb.auug.org.au/

Bagas Sanjaya (2):
  ALSA: docs: compress-accel: Format state machine flowchart as code
    block
  ALSA: docs: Add toctree index entry for co-processor acceleration API

 Documentation/sound/designs/compress-accel.rst | 2 +-
 Documentation/sound/designs/index.rst          | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)


base-commit: 0216ded72db896b24cbdd8cd6531482571b25cf6
-- 
An old man doll... just what I always wanted! - Clara


