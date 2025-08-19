Return-Path: <linux-next+bounces-8011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC6B2BADA
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 09:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45BD3626726
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 07:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF092BD030;
	Tue, 19 Aug 2025 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0xHpxeq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7D24BCE8
	for <linux-next@vger.kernel.org>; Tue, 19 Aug 2025 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588880; cv=none; b=eabFEfieewgllNB7CCY/8y63qZ8GRItnpx/aHzrQ9XysdShkw6zJ+F+xVbAeF91EyK83M5Fp++BEU2cH0ZRXR6+M1st3PeA3gCB9903/peEW7FJUQhkkaDgE0I7h0nJ3VNB6VOhkIBZoQEOl/2jsnEhbhWdGuAjosDE/BjaBWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588880; c=relaxed/simple;
	bh=mo6QMFKDxyh3t+yNV9NKO9AzDGESDf5V9BefxEECWhA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SpXi/7fwxpzzm7u2Ts4gJI+28UT6SczoRFWc0fJZxUJ9jYZSfe0MpjGqzA3BqxoBndwmgbCAYUYkaIm8wMrw98PB1lw3njsAXb3VCrezh1fHZm2gvm9gkMJPG6uCA8q4/7ZwkpI5EKnKHhTf3q9QCM3iXDZnjVBmY+4+ZKQdzD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0xHpxeq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-76e2e890901so9704806b3a.1
        for <linux-next@vger.kernel.org>; Tue, 19 Aug 2025 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755588877; x=1756193677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0gjQmJyLWyyM34EUsK6b+yflZfBy/ykkULtt1gmp0aw=;
        b=I0xHpxeqAh+IXQhF7OW+Z6mlEj03Q5XhDn6qE/6roPBbNQzN+OgDjP+o+48mRY+wSG
         fv3A9WlgtEyDLQ1qfiPCCdHs8/xPS5/w5UjHs5FrRVDNXdy2SUvR03RfYtC6dODNtDKW
         daBnTJ1EAGqTCenEquu3PcQGril4pj1TRSVTzkWlDpXoOe0K69xwIGDCLvFHfoBkpB9N
         ZcFirVJ3oLy5Jdlce12EFdWrHNe+/+SZk7I20scgkYGzBF/VDA0WC7hjNIkICM7GKx6y
         coBvfOclsggnp6kOGdJHn40hXUH/OMRnazWD7zUC/48b9obg9VJm7wabQSRUh6re8D4p
         qJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588877; x=1756193677;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gjQmJyLWyyM34EUsK6b+yflZfBy/ykkULtt1gmp0aw=;
        b=jhj1a1Jwdl1AVCbcO7oqmMAtkLdAq6EU+A6FDaSPkODY8hDIQgCHu6aUMcBD47hH/Q
         RunXBpwB3IvH4FxLUb6uEMU6Wi4LPDdEK0BPE0VIm93HCOaQlmxFFEVfv742KyNHX9FN
         rvjxV6N2EBdMAIUNT/fGhVAPqxlM50XrPqImZ7KZykHBYfulcoSvhcba1nkRDNZqlvF1
         SvxRYG7FWezhF6AMPVPceFg6VrKQ/H3kXMaP8hWZa2Kb7AV4Ut1p0C0n5KKiVP/cDWsB
         2ZmB7lMnbFXUCsj+LG5ozF5GAP1HGcGqo+DmDRN3FV9k36A8FC8h6bKcBDhVqT0IPkCw
         WmhA==
X-Forwarded-Encrypted: i=1; AJvYcCVIrQFjnbGmmR+VciI1ytaOuB5IZRpDXukcuLMIVbrBDJQJh6HHjqlBtqOIocpY4qfU/qekxJtJgteL@vger.kernel.org
X-Gm-Message-State: AOJu0YymekulsPX6MdIT+AP/A7XMVj88u9nYZTge8Y3j6Irt2fK+A/n1
	8bnyscivGDltGxoNcX61gd9Qf+9QbGDAj6l5lXpdQIzMOJFY+pO7Q08xyX/zjXoVqlNRtQ47kN5
	d7k1DUjyjD+cAmQ==
X-Google-Smtp-Source: AGHT+IEQNZ2+f6e9TNwetvOQ+hPmPxwMV2Wzkl2ILCeYpSP1rxXPD78DlfuwZr89GPZOqtlPyVjHcqV/V+GqUA==
X-Received: from pfbfy8.prod.google.com ([2002:a05:6a00:8288:b0:768:7cb5:740a])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2184:b0:76e:7ae5:ec90 with SMTP id d2e1a72fcca58-76e8111212emr1805413b3a.26.1755588876576;
 Tue, 19 Aug 2025 00:34:36 -0700 (PDT)
Date: Tue, 19 Aug 2025 15:34:32 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819073434.1411114-1-davidgow@google.com>
Subject: [PATCH 1/2] drm/xe/tests: Fix some additional gen_params signatures
From: David Gow <davidgow@google.com>
To: Rae Moar <rmoar@google.com>, Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, intel-xe@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In 444be9072fca ("kunit: Pass parameterized test context to generate_params()")
prototype used for gen_params functions was changed to add a struct
kunit parameter. However, a few of these used in xe were not updated.

Update these so that the xe_pci tests build and run again.

Fixes: 444be9072fca ("kunit: Pass parameterized test context to generate_params()")
Signed-off-by: David Gow <davidgow@google.com>
---

This should fix the issues found with the linux-next merge:
https://lore.kernel.org/linux-next/20250818120846.347d64b1@canb.auug.org.au/

The following should reproduce them:
./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig drivers/gpu/drm/xe

Ideally, these should be squashed into the corresponding commits: let me
know if you'd like me to re-send out the whole series with these fixes
applied.

Cheers,
-- David

---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++------
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a65705814b9a..f707e0a54295 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -44,9 +44,9 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
+const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc)
 {
-	return graphics_ip_gen_params(prev, desc);
+	return graphics_ip_gen_params(test, prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
 
@@ -61,9 +61,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
+const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *prev, char *desc)
 {
-	return media_ip_gen_params(prev, desc);
+	return media_ip_gen_params(test, prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
 
@@ -78,9 +78,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_id_gen_param(const void *prev, char *desc)
+const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc)
 {
-	const struct pci_device_id *pci = pci_id_gen_params(prev, desc);
+	const struct pci_device_id *pci = pci_id_gen_params(test, prev, desc);
 
 	return pci->driver_data ? pci : NULL;
 }
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index ce4d2b86b778..690b36e6500c 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -25,9 +25,9 @@ struct xe_pci_fake_data {
 
 int xe_pci_fake_device_init(struct xe_device *xe);
 
-const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
-const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
-const void *xe_pci_id_gen_param(const void *prev, char *desc);
-const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
+const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc);
+const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *prev, char *desc);
+const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc);
+const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc);
 
 #endif
-- 
2.51.0.rc1.167.g924127e9c0-goog


