Return-Path: <linux-next+bounces-4484-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EC9B2EB7
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 12:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA15C1C21AD5
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 11:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B391DE2CF;
	Mon, 28 Oct 2024 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEFsTGBY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17F1DE2A2;
	Mon, 28 Oct 2024 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114228; cv=none; b=b6MMqQWGLwh65/KXd6Fyd2frDleHCY2qHreT87Ep+Mgyo828M32YMe2sXdvV4wl55fXLDSkxHRIfCjXHdZnBpzpotcza36jK3ZYHwh55bqDoF99n8xSk7t9flNPYwUCF2WxMoVTpURHnPHrAR6mx7i65IA+8fln0I6lZvFQ+qv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114228; c=relaxed/simple;
	bh=OTijBIUcwgooA47bUDi5GXCl66rV6BVPvL4tjKZ05yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCne2dG+lu0/Br08/c4PR5yTCFsNKwG8e55Y0byQVz2QPFyTw4Bz2/FXcptDd0emsQyjfnF+oAwP/vpU3XP46w3oIYnWsVmcBUvn1i9FP+HeS6BkM1DSMpP587O3J5dsZfrBizxIJCsDNDdt6dlwQJNp1YP3QJPF0wGmVpT8q2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEFsTGBY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so3291345a91.1;
        Mon, 28 Oct 2024 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730114225; x=1730719025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/Xed2jsd+vQgTX6pPhrgTHZ5oskzqTKsIs39zQq57s=;
        b=mEFsTGBYc/wDcQXn/u59qg08hgL4UsgPpUFD3SIxa2OgxE1uIVQ14BACt38lk88Lvf
         ptRV7UB1nQVe3PhGkL5k6QbwwSFJBFhi4S4EtDhejOUNqgK/g1SZwCSPYTHclWs/z1YO
         PlDYcVu2h7QLVHULHkA3llv+dT/PR+NVkRxMn3ATMXXabcGOBojD7jYV2Rkp3RZ61oen
         GwV1uVXXUvpZo4XoqVv0hmcDASrORaI+te5tcDubV0fJvvXq/oLqkbWRJhpV2gCz0bHi
         sKx1L4s194gQQcNkL8BugQ1VyyfeKzcVzBJDvFp2w3mH4/dXImqBZAEg1XrPyIT5AyG3
         M1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114225; x=1730719025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/Xed2jsd+vQgTX6pPhrgTHZ5oskzqTKsIs39zQq57s=;
        b=rD1KTYtIyuTQPieUPZ8NYqYsdtalAaW6OS6TeEwH9e+97cDJJsTc3+RlcRndRKqJi7
         Tn3HZ57vRyW21Z3TaTC9vSU6gF1K4CUm1Z8OmfKJxiIHvCBThxv6X+RWjOMo2rNkyeky
         qPNuhgeCTe8fx10Fa/DjCAN0rbDbzzcn0WbERXW3sncKBq6gAsNRTYXwZ7semlTHlH2a
         2az0ORQory9t0X1Cu5IAV2QpXQZJas2rHfCj4OcBDHSSlkB4oJp0YdnbNz+B0b8HdoNa
         1LFbo9r6ha7EZ1jc3/mBCyuyRQkmbPEYtVSJABr6HqKKO5oQU1cOJ1QqoNcCC8ZOqKDl
         qy+A==
X-Forwarded-Encrypted: i=1; AJvYcCU4WBqyuNITx7KVZd9tulaznkGe9tHNwXbbjQM8tvsGjys4105Q7HnhviFo9d6oF/2B/mADTlxzhndXCoo=@vger.kernel.org, AJvYcCWQyeEeeB60X7FuK8roNcX5j3zX1VjipN1WfEhOYr9p7y4fKKZkoRQQpY8wWf9dTsKVXcZckIZ1rwNhsA==@vger.kernel.org, AJvYcCXs+h2OMQsgwaHCdG5caHhsCc+T8kEACKrmLADC6dMiheEZbkzHU2nqQBeOws558a6HaI/VYVMO4AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRHOshaVHYrkIDGbWqfl+lp10X+SPnbrwv70yuxjxikNfKz03n
	v26IEglR4XbPWzrvI7okXy/1VbkGtMiNtAmrdJM2mUO03HbCWzZE
X-Google-Smtp-Source: AGHT+IHA55N/8xPPC/gV4dwC/FvKIinNKqyPZJLHqNOLWmDy6n8NgXi4zmv/xP1i+F0Nv/ISKkEcsQ==
X-Received: by 2002:a17:90a:a004:b0:2e2:a661:596a with SMTP id 98e67ed59e1d1-2e8f105e840mr10302191a91.13.1730114225454;
        Mon, 28 Oct 2024 04:17:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771775sm6883251a91.49.2024.10.28.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:17:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F143F425A749; Mon, 28 Oct 2024 18:16:57 +0700 (WIB)
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
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] ALSA: docs: compress-accel: Format state machine flowchart as code block
Date: Mon, 28 Oct 2024 18:16:46 +0700
Message-ID: <20241028111647.17378-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028111647.17378-1-bagasdotme@gmail.com>
References: <20241028111647.17378-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bagasdotme@gmail.com; h=from:subject; bh=OTijBIUcwgooA47bUDi5GXCl66rV6BVPvL4tjKZ05yk=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDOnyhauf77+Qk3DausXtv/Wzr/qRBrcu+U+X/ZQdqnp80 0SuXj6FjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExkniQjw70fIprvPZafTV+p uegB553QBaHi6X0cPwSnCVTxa79VXMzIsN8/6/5hQ+uvCzu2//S5smG3lsauje02K7kPKd71/CQ azwAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports multiple htmldocs indentation warnings when
merging sound tree for linux-next:

Documentation/sound/designs/compress-accel.rst:67: ERROR: Unexpected indentation.
Documentation/sound/designs/compress-accel.rst:67: WARNING: Blank line required after table.
Documentation/sound/designs/compress-accel.rst:68: WARNING: Line block ends without a blank line.
Documentation/sound/designs/compress-accel.rst:72: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/sound/designs/compress-accel.rst:73: WARNING: Block quote ends without a blank line; unexpected unindent.

Fix these above by wrapping passthrough audio stream state machine
flowchart in a literal code block.

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20241028193242.11597640@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/sound/designs/compress-accel.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/compress-accel.rst b/Documentation/sound/designs/compress-accel.rst
index abf1f76a87785c..c9c1744b94c2c0 100644
--- a/Documentation/sound/designs/compress-accel.rst
+++ b/Documentation/sound/designs/compress-accel.rst
@@ -57,7 +57,7 @@ from the input buffer size).
 State Machine
 =============
 
-The passthrough audio stream state machine is described below :
+The passthrough audio stream state machine is described below::
 
                                        +----------+
                                        |          |
-- 
An old man doll... just what I always wanted! - Clara


