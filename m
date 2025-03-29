Return-Path: <linux-next+bounces-6086-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D8BA756EC
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 16:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7B8F188DE07
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D408192B82;
	Sat, 29 Mar 2025 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wi2kje19"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE921C4A2D
	for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743260817; cv=none; b=UocTxMvOAfwVG9gvHzAz1Nx1Wk3jZVzKM2H7bvv+f7AvXtSwtmgg4ReRo7E3uPrVM5wVVmkraDY+tqDTF+npGUsJ9qq8P16vlVf3s9BZaYJy2bErRSGGUaMuqTLQoakb4Zf1x5+PIzKknWUKbaMd7zti8Hf52PP7pD5onurTY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743260817; c=relaxed/simple;
	bh=vhrh+9oSpP0DEWejdyfXK8eNWvvXri7PQXavL0j3KlI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=mDjfHuqlbZbTpd8gXkAjLM+q8CUG6wg52rL551ejpgPl3jeBEH32hZ2e4BiLl3olHsk6G+t/vaayQ3DVNUNahkimJ3/CoTdl33FsiadKr1IdsKyAVD9Ty6Xk40mys6kdNzUClRJ3MicZkfaTGuHzAb6JXL4ZSFMn22uQ/9jLjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wi2kje19; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743260814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S8zI311lqbyq1Z4you2dOBLeU+B8GZ4SBxX1alQksoE=;
	b=Wi2kje19e+NFqtkcc4960/33cx2/D2F/nAHS7RE4cVUuR3PoZdsmqhe9RbpiARFB/jEFKz
	wLMbGN7KWtqDfKck4MccQeJuU0RgUSnum9SguHXIfcxeA2X854kv5rHLS/E/X72cZeLBwW
	7kKq2mjZFWK2x8axI29/YcBOPij1bf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-jFxSkRwTNRGNPH5KV_-HTA-1; Sat, 29 Mar 2025 11:06:52 -0400
X-MC-Unique: jFxSkRwTNRGNPH5KV_-HTA-1
X-Mimecast-MFC-AGG-ID: jFxSkRwTNRGNPH5KV_-HTA_1743260811
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d01024089so30864475e9.1
        for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 08:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743260811; x=1743865611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8zI311lqbyq1Z4you2dOBLeU+B8GZ4SBxX1alQksoE=;
        b=hbtpABzUQPz0X8jzKpyLGgPwKHG1M8Nom7gawtw0r/tpjdFJQ22QgZ0qvaM7lpOlTZ
         m7cDvydHo8XjWV72LyRGVILRrwAHAzot+9UJIh9aJSO2nkKcT5txOnluPempG+mU5DCR
         /sVjR3GVKR54voQhBr2VSpYNwwtUnZ9ZvtjhNknWwNQdOhgYSMhVsSfAV6OVICMQ7kRm
         USGKfQgG83AqMDwjYa9dBSoCAI2jtvIN7Ebruo4u3pVyI9/JcaPzX9IqaO7YTeioeUV9
         3T5Sb6eaZ5I3fazwhC8QH9yRG44F1WU9A73LyzT7GWwDXR9s+pudf4JFn/8tqSKiC+Dd
         QD5g==
X-Forwarded-Encrypted: i=1; AJvYcCXOD3vHmLuIYqROt90PevfDkfbj8Mh4rzLhDsE/0WeFIHIMkX1bdtAGYzWFgZ3HYAATN0FZvIm4ksWC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Maa+md5aEFr+4OmyVES0gr41HMUWr9/l9SzFlmdmqPGOCPsA
	9fO/zOWmyDpm6Ns7709hZKyNfAHtd+IY+xUYHeLkJkAj0rpnCzPHmSeMIWfs3ZusMz/Qxi7n1S+
	X+dBRc5RUr5FknV9rTQhFyEi+q8bhU7d/M8GTZ46lUWO4j5/QchAXkplf96I=
X-Gm-Gg: ASbGncsqEWbmgv1qs6/yCXOXN7dHCZGaFAPXdC8m7fd0sAoLiNO0Sziaazmmboyeb0H
	FTCR+IqcWuadNFRhqvAgHOOA+Lj04TYTewRxF80RprYXp6syX18sp1R4dkygFwyUT28Cj81At8v
	melIWXgGLcStGhl19mtZyyMYKvStza+n+bd2LDaJm7P778VVoOcYBVCAPhybSEwI0VZ5bCfJkAl
	wbGSHn/uXx2foq3OwoRRslGiaqhkFygBdM7mOp9OOqhTizO6V5Z4dK9DB0e/zimocgpA+OFFXLI
	OMoU7uAMZ4gcI01AxUFF
X-Received: by 2002:a05:6000:40cd:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39c12118f51mr2203363f8f.42.1743260811345;
        Sat, 29 Mar 2025 08:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET88jcJ/fUhMkJBzo9iXANXxVp80YEfKLaDkLOIVe2hPzsFQ5lK7sBVk2xeGnWFUm+16DMNw==
X-Received: by 2002:a05:6000:40cd:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39c12118f51mr2203328f8f.42.1743260810973;
        Sat, 29 Mar 2025 08:06:50 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b662850sm5914994f8f.26.2025.03.29.08.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:06:50 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] kunit: fixes backtrace suppression test module description
Date: Sat, 29 Mar 2025 15:05:29 +0000
Message-Id: <20250329150529.331215-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Adds module description to the backtrace suppression test

Fixes:  ("19f3496") kunit: add test cases for backtrace warning suppression

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/backtrace-suppression-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
index 8b4125af2481..d4c5df09bba6 100644
--- a/lib/kunit/backtrace-suppression-test.c
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -102,3 +102,4 @@ static struct kunit_suite backtrace_suppression_test_suite = {
 kunit_test_suites(&backtrace_suppression_test_suite);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");
-- 
2.34.1


