Return-Path: <linux-next+bounces-6085-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C4A756E7
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 16:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAF88188C0D0
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 15:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C9D1DB361;
	Sat, 29 Mar 2025 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTDOxj/F"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46B192B82
	for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743260688; cv=none; b=XyoIhIlXq6SlArwznbXpdIsU/gsDLMQH5T+Rhn0cRW6MEfgY5viZKKOxv8T5MPE1z8FQ9tUrvliGoFVuOZofMfVuIUWJ9+CS3bGcW3Pau1se9NNGcHiSYPdO/lcknKLkJ6RkVjHU86n8kpayXwo8rjQStdsu3gCkOCsT5Qt46g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743260688; c=relaxed/simple;
	bh=puzgkOgCUPbE+wQ6SBvpkomea7X06UdpL4PsTVyABso=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=MMQFuyQAJr78hZ/Gf5FSwrOuXLjVFMkO1jogGff5n3CYpjqEMByTn1qcDlGNov1/JoEFnKj7qrpFK2EVmd1PIUiwoXEHxvNPExVh0xoOaXb99Ac3QGOlJKqBTBwIO5dvimUGtAuo/kDYmtFLda+q59F4qukZfcZghzRbZqp1tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTDOxj/F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743260685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9rZcFa00OKiutAluKujooWT6oAB0DkFh89UjHpXtZTM=;
	b=DTDOxj/FZO2gwVl/tOsvXe/ZggDEI6LglvEEgsuv4jncaYKdrOvciahpM3vvD+rHgRH4k7
	mcnXIi44ReQIH8gbA1MXdBytPiUc988YUaHQ4dgO7rVJzsZ6EkiiYnwvFfSZEuVfTzLVcA
	FhGsJ1R5Tz55imya+lAa8hbGDC1KCuc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-QigXErEcOQeH81xgm3CV7Q-1; Sat, 29 Mar 2025 11:04:44 -0400
X-MC-Unique: QigXErEcOQeH81xgm3CV7Q-1
X-Mimecast-MFC-AGG-ID: QigXErEcOQeH81xgm3CV7Q_1743260683
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391459c0395so1208560f8f.2
        for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 08:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743260683; x=1743865483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rZcFa00OKiutAluKujooWT6oAB0DkFh89UjHpXtZTM=;
        b=UbrNQfC5nBiejgoqDr7ZLqUmH8Jr2i0iS1DBgyq5rGQzYs6RVDsMEVoEp7stTfJSkT
         BTzOrSzqcF/a/STBj5y12kFgcN3tAEyZIZGt0DxtwiIGZjGzY1o2pVJPc0Qh0FDDXWpS
         zcE2SBLH8gr3JZoBKZq6KFh4c7WgiWeaO3AEPf+VR8ItGOTrDezWWnf88YTzija8XmnJ
         pc8zSjNaGYkstsCEPMuCOlRgRVJG1b2tf4DDsWmWKkgoVtjZW5kxd1ZOVJ1i4nVdzzAo
         SNXnS8DF/DYmKOqK4hpQ1AGY01J3Z03OKol/mK90vKspJlileWt9cjwTN3b4NnXEMwO/
         s6ag==
X-Forwarded-Encrypted: i=1; AJvYcCXgm7pPe+RQHNlZj2+HK/Q+Cf7RzJv6f1YLp4YhSenOnC8feMOipemwjqfHR2aKobuoSpiy5cV95I69@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCASUaD5XCYkdZyH56XxXH0v7l8QWSDTPV79cT9kth6eIj54n
	3sYOBhH5y7GZcVxQMj1FQc4LBgwBYFtAzR7j9YCfxC5U1HDHuuxnHUssYwqrxbFlLREFv+CZXMk
	PE5tpwRDJ6q4SVaqcoe47BQfQZqShuM5xgIOdnH8FnwsABndZiGz4odPyvis=
X-Gm-Gg: ASbGncvA2PSfIUblvA2R1I8MC/SBDbWV6+vw6pqsWQqZFnGOzuztRil7GsvCD4UqmAT
	pP17AhxVzN+bZywnFHDQx4xlfhmlJD6IFCVsZtqjcT5gEq8AehAuD4cvBo3FY3G2wMx7mbSHLny
	W2OnxCjMokG8i+DnTn4FRCaBk49Zf5eLvLQNcC5MxQHMDCFhxDHdZp7FyYwsXC9ZWKrAopkMSQZ
	E0wrtoymIyeAJrP11LZSOTVmqPXl2XNVE5X2KX1UQxbSNBAIc/kPC2OImHD63q8SQx1hR1rTJR4
	2SaJDTBGoVa8mntfOAXD
X-Received: by 2002:a5d:598c:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39c12119db3mr2073769f8f.49.1743260682749;
        Sat, 29 Mar 2025 08:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/2bHdcw2ELtkQnH3PJgr7VcNq4CZ6lA8znbzDKP3oWHKcunfSfI/tIlxfFak/s1ZEaKAEVg==
X-Received: by 2002:a5d:598c:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39c12119db3mr2073713f8f.49.1743260682362;
        Sat, 29 Mar 2025 08:04:42 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm63073205e9.28.2025.03.29.08.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:04:41 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Mickael Salaun <mic@digikod.net>,
	Kees Cook <kees@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-next@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] kunit: fixes Compilation error on s390
Date: Sat, 29 Mar 2025 15:03:20 +0000
Message-Id: <20250329150320.331018-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The current implementation of suppressing warning backtraces uses __func__,
which is a compile-time constant only for non -fPIC compilation.
GCC's support for this situation in position-independent code varies across
versions and architectures.

On the s390 architecture, -fPIC is required for compilation, and support
for this scenario is available in GCC 11 and later.

Fixes:  d8b14a2 ("bug/kunit: core support for suppressing warning backtraces")

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 201402f0ab49..6c937144dcea 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -17,6 +17,7 @@ if KUNIT
 
 config KUNIT_SUPPRESS_BACKTRACE
 	bool "KUnit - Enable backtrace suppression"
+	depends on (!S390 && CC_IS_GCC) || (CC_IS_GCC && GCC_VERSION >= 110000)
 	default y
 	help
 	  Enable backtrace suppression for KUnit. If enabled, backtraces
-- 
2.34.1


