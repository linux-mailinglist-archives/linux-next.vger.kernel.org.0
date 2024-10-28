Return-Path: <linux-next+bounces-4482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE69B2EB2
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 12:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CABE1C217E5
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 11:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D351DDC18;
	Mon, 28 Oct 2024 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OARIjY0L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A701DDC1A;
	Mon, 28 Oct 2024 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114225; cv=none; b=Tbdy+Zoue9hhwpeqoJc5mwPg9jODkxO/ftq8dthuciKKyCmdy1WG24Y9Z7IaxGwJuIQtO0GHUL287fSYD7e6P0cJqybeikTV6YiAiYnHUNGwZV2nPxAfPD7J4c9+nqh5lPvgacJSOcvdlOEaYhNwkofkF9f5xsHR0QfAu8jqOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114225; c=relaxed/simple;
	bh=udgix+BA0Yz2Z83UTmnihD9al1N6MkL6rU4Csfuk1ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZt6nVXiqrBNYm8Uh/E1sqSCebHk4GWKNLesnxmplhqZ41/uj/pAu6fhpLot6HLOBCJgfdpbyKpRddJoZk9e+oVi7kJLJOtd1uihUgvjDkBv6Au7P3CGbx9IeFi1cOaRLIJ8QTqmD0vGWVELTBplfvHBauHkYaA55DBwSthCfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OARIjY0L; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso34274305ad.2;
        Mon, 28 Oct 2024 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730114222; x=1730719022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL6hFT7larAjJLBZMdITsgjQqEgj9ErnvLNAtVfMEd4=;
        b=OARIjY0LmE0eSB+cKNuAIhKkzvGHRT+btGQdy3UdNhirlYeqnDevnXq8wU1u/cISWW
         cKnshhj+TI6ymGsh9aBNKCXa+5YN/Rl9LKVvrbTHnt437+9JQgLLxuFRqcsN2JPeI6pe
         B+kzEtFv0s0Khd2cmM/ALXXVIWhVMcyH3telXvS3wn4ujSlLOwo54AR1rHL+gKLDna0i
         U6Cf7izw4qUxUatJR5xwbP95b2vCLPjc6VNrffceva56OJ+TGDCR2zGEvkSM2X4BGFyp
         8nqXftxBPDbvOt23Hz/85IuSBHAJZaeoUZTVlUzlelUVHj5ah8EaiC78kPFcFxAzFzho
         phKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114222; x=1730719022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL6hFT7larAjJLBZMdITsgjQqEgj9ErnvLNAtVfMEd4=;
        b=S5m4s6otAZUk1/3vSokYmYBwFYh/+2mklJmayVIzblrMl6vfHzMhLWYqjBh/SMdjqu
         SQdBk+IvN66j5rV1rXFIAgDW9/dB5OwRyFxKgVTc5p0/oF11hY1E5aKac5f914bZmqJA
         kyl0IRh1T04ukWiWeA61lHFTKMvgNg7lt2rs6V/kXWBB0AMAMNNaucQIv+Xvl695fhGH
         WtynbWTcU7bSiIdZLSnFIAvu8S+gSGpjFfc6LvStZ21U37tCkn8XnSbICcXbi5sGZ4zc
         EDMoYD17rtrGEYjG8wj8LMb8I5ltSO+n1PQCAd41kn4rQs28tNAaWybhFb7LruViUrWF
         MUWg==
X-Forwarded-Encrypted: i=1; AJvYcCUOPU09+5H3LG2AlbKWPjreGXJbbfpc5RfvtVcaree2BInUs2ET5J6Fwz3CLCd6f+3fTTW2ko2JT+03vwo=@vger.kernel.org, AJvYcCVoy+9dBSm31xBssiaOSGnKVCMg2HbWl3fMn2Fxj/BwrD14V5q91BwPs6bg834SNfolpwMcL/JAvdU=@vger.kernel.org, AJvYcCXdIvq3HlvZ4v4WyySaA08n81+XVRDKkMqY8Ej8t2IwqsAZjm6dU3i8w05APCMAtlkDROxeGG/Bz89ZFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYRZS4bQX90A2e6gisvTHtSxtTnkleY2qsnb+ZoowER/QPmz49
	M1DO0IC8q3VLG+M/YuZKTk4WkV0TVPua6kJQUUakG5+rKDnrDyGNYwA03w==
X-Google-Smtp-Source: AGHT+IH1c58av/1fFAVD8AQ4N/eqv040FRu0hs7Od4OPtw3SNK1WOehtmjdxskjDV8eLFz1UkKWxHg==
X-Received: by 2002:a17:90a:9a8d:b0:2c9:a3ca:cc98 with SMTP id 98e67ed59e1d1-2e8f1057e99mr9995788a91.7.1730114222236;
        Mon, 28 Oct 2024 04:17:02 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3770e48sm6793276a91.47.2024.10.28.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:17:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 101FA44187FD; Mon, 28 Oct 2024 18:16:57 +0700 (WIB)
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
Subject: [PATCH 2/2] ALSA: docs: Add toctree index entry for co-processor acceleration API
Date: Mon, 28 Oct 2024 18:16:47 +0700
Message-ID: <20241028111647.17378-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028111647.17378-1-bagasdotme@gmail.com>
References: <20241028111647.17378-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=bagasdotme@gmail.com; h=from:subject; bh=udgix+BA0Yz2Z83UTmnihD9al1N6MkL6rU4Csfuk1ls=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDOnyhavf3Gvh2n/JPe36t4vsr7bN5Hu81De5lvk6S8TPy 3ruIlqXO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjAR5WkMfzg1PjW7/+Kxe1cu nD6/4Oq3pb72gSceCczOf6cy27hs01qGf7ZhTBPdpRqeqif+YGGYIHco08jpy9/E31axBe71RV+ SOAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports missing toctree entry warning for co-processor
acceleration API docs:

Documentation/sound/designs/compress-accel.rst: WARNING: document isn't included in any toctree

Add the missing entry to fix the warning.

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/sound/designs/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sound/designs/index.rst b/Documentation/sound/designs/index.rst
index b79db9ad87325a..6b825c5617fc16 100644
--- a/Documentation/sound/designs/index.rst
+++ b/Documentation/sound/designs/index.rst
@@ -6,6 +6,7 @@ Designs and Implementations
 
    control-names
    channel-mapping-api
+   compress-accel
    compress-offload
    timestamping
    jack-controls
-- 
An old man doll... just what I always wanted! - Clara


