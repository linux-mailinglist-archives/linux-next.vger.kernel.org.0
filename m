Return-Path: <linux-next+bounces-4333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 814AB9A526C
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 06:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8A2B1C2118E
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 04:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96B76FB0;
	Sun, 20 Oct 2024 04:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mla2AEYA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7F68F5E;
	Sun, 20 Oct 2024 04:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729398432; cv=none; b=S5hjUAx7lpJBEKg/o7PuUPm4ho3+Oy5g2s2l/ZwuMe6WuoRvshlwzemP9CTpKkb7b10SnKmqzWvoJ1ZA+Y3yKX33pfYVsWJ9V5Wvd9eHvzbKBJs1mnUdxnO2xJkHi0ApYw7uYMxIzR3Qrld9tF7VdquKkdedZwsb9ECdlgfsPAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729398432; c=relaxed/simple;
	bh=D1RezRlkB9L4TfHEDkozhaaOZUO1U3mlZToPaKXwzXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbNWA51Z+MZ36x7CaZ8k5X6JmgiJ5IEx4NgEirsWQHHP5AoBTMUja3vTkGfeqYW1fGCbUl30mg6pMRMfeBWEBazPNsoPwwq1FbVnBaYQYa2o+lxR7YKQcLgIPUT976S968UII5GYPigW2Ve0pIgjt+/celOwecXR5PDAG+t1BT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mla2AEYA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0472306cso441675466b.3;
        Sat, 19 Oct 2024 21:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398429; x=1730003229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5hnJw00SHkS8Yg/z28Fwh+SQ2vwZshL2rzFNrvtoN8=;
        b=Mla2AEYAhyn9vxDQc0/8PyBR5bWG51Av/Vps72N2hisNiRqNlr7qMGv3AXdLTPWKVY
         AV05IWwc3zJR6ki/hMrHtDejOMZZz+E8MKMCPH/d8jEgq1JJhqNTyjs7FTMTGvXKFgAi
         OQwGfE4X2CItGWCxPCC+jmmriI7o5TilFMk1yUSkiD/jpByE2ykrffRS6HWa0Fs9A8jL
         oH2UlQRJNRQAt4P/iC5630R64fp9+sfJVoRutJJGoNkfVOFhdrIgMC5jwvSwTLUQ5bio
         Uk4P8kIrhjhouKIkR+jHjMznxgUNmbcGbj8waR0T8LmYaVGnIdBJWO+XoyBQeS1Q4QRF
         +ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398429; x=1730003229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5hnJw00SHkS8Yg/z28Fwh+SQ2vwZshL2rzFNrvtoN8=;
        b=f5UBpYXlylAdDvi9IIyDx4Q3uG9gE2r2JMKf6PLww5Tw4dybsR4GulSX30xg8gjo3G
         Kppf1a0ydTOHC9RA3KQ7QVl7eucc29TrjDtdymUrmxW0ZRznc5goHGKTg+OVbf15yDlz
         fyIT+LLV3TW5yTwpHAQbe1+OvSXRPXrGHHnSa3sTdjXojEaLXGxXajLNq/B0olTjlRdQ
         ReVpnCm29L8KSUAFB1HmYSfkuFga5Dy9kpdxgRaWKUt9o1AxTqWjn5TjM7ea/0d/+yxl
         SfFQFJi4MYlD38n4Gjf5OU3tVUb/4vOjxVaLpyb1gkP08Pvy3r8jlMbbGBuEH0sgcvdh
         9IPw==
X-Forwarded-Encrypted: i=1; AJvYcCUirV9RTuKwSLLbm010kko8iRW/pONy9a6KHvKgWjspDXxQGJiXyQARA9NsX9mGsZsV37M9GDBSg5lH@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5XaoYZmlYkxwbet/CGFqbuxBtkAaTE0A4p53Mc3Y8RveWnEv
	5Jk4r/C9o7uONJsoNTHqtyw0YkE0DNzhtSHDxe3aBTpHeMisdiSo
X-Google-Smtp-Source: AGHT+IEoN4xc5/Tx6bMejoVoteamzsBJhLtm+0tByF4wF1Fd4S52hX2jt8Ei98iyjI+WqELTS1N7MA==
X-Received: by 2002:a17:906:4fca:b0:a9a:1bb4:800c with SMTP id a640c23a62f3a-a9a6996979amr725802866b.4.1729398428641;
        Sat, 19 Oct 2024 21:27:08 -0700 (PDT)
Received: from work.. ([5.250.149.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91597c05sm47221866b.195.2024.10.19.21.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:27:08 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	sfr@canb.auug.org.au,
	snovitoll@gmail.com
Subject: [PATCH] Documentation/kasan: fix indentation in translation
Date: Sun, 20 Oct 2024 09:28:13 +0500
Message-Id: <20241020042813.3223449-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016131802.3115788-4-snovitoll@gmail.com>
References: <20241016131802.3115788-4-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the warning in linux-next (htmldocs):

> Documentation/translations/zh_TW/dev-tools/kasan.rst:410:
>	ERROR: Unexpected indentation.

This is based on -mm tree (linux-mm-unstable branch).

Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 Documentation/translations/zh_TW/dev-tools/kasan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
index 35b7fd18a..27fb76451 100644
--- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst
@@ -407,7 +407,7 @@ KASAN連接到vmap基礎架構以懶清理未使用的影子內存。
 
 所有 KASAN 測試均與 KUnit 測試框架集成，並且可以啟用
 透過 ``CONFIG_KASAN_KUNIT_TEST``。可以運行測試並進行部分驗證
- 以幾種不同的方式自動進行；請參閱下面的說明。
+以幾種不同的方式自動進行；請參閱下面的說明。
 
 如果偵測到錯誤，每個 KASAN 測試都會列印多個 KASAN 報告之一。
 然後測試列印其編號和狀態。
-- 
2.34.1


