Return-Path: <linux-next+bounces-4044-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F498BCD8
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 14:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F23E71C236DE
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1171C3F09;
	Tue,  1 Oct 2024 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj5qk1nu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D419D88D
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787243; cv=none; b=CPf3cKUf0ntWl9CVGVxL1JKijWRtu/NHBe/dToCKGqS2y0CrA404Brss2pH33w2H/S/A6o7HRYBcaw9zEgKmmOTAtyJe2dojbPap9eSVCSwLCqDy1FMvdQHipwSb2xN1uDehD1L72YvEQ5nJt3nARboLDK56LGT4dIJEnaa6k2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787243; c=relaxed/simple;
	bh=YK//ymCXMNibgnWwiEYPH29kLnqQE7EcO/RQTyKGXO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fk8YfZvdw06XENHtyDO29SLJPe6zCtXkkQKamq/7slb+duXNeBX+PXndkAEZBRYRSAclv2EN9+/jeQsR+EoqpuCOyQ/PCUEui3sJT5uBJVAqwFrYg2XLrZwI/TXz69t38QVWiI/ymlRHWtTfj1gomtsBcyZ8U2vpp+5hEQ4xaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj5qk1nu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so1206616066b.1
        for <linux-next@vger.kernel.org>; Tue, 01 Oct 2024 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727787240; x=1728392040; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjap3J0Sw2JAr1hIBNUQRegafiVlUUxh2HbVu57tMmQ=;
        b=Bj5qk1nuFbB1nTYURo99blBuFrGVYf4BmEmQmAjO0OLWS6fagTasGgWVEIWvWGrNcI
         4SGjWSGOlPIvWer0mwniX0Hq0CUp4WkW0L2N+F5OqEbfUW3ROV7dcUh9onkn1dnb1Yi6
         ZArxuwvYpzcFtIEbbRzDnnhqf+3SHUqRl2g3YFPF4O/6HN5gox/HYXD4KomRUPmVdhYC
         WVvATQON9ldroK6gzJFxNpgXkZgzpidX7zkH3sD3OcvDjlpmt19aqtruChHFHD9pCy0t
         wUr/7WUuCJRpDHJ+ylsnKieJucMXCXOzl+h7ebfL+nzx+OCrZf5937ihv9suYK0mUcdg
         FULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787240; x=1728392040;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjap3J0Sw2JAr1hIBNUQRegafiVlUUxh2HbVu57tMmQ=;
        b=NxEm+wnCxyCldmysU83C21n9iOF6SLgb3WPFExrurPQ1PjuUs+WGoGrsVrMpu0ZjFm
         bhKklAnvxloasYP8G3PT0gQv7w0B0Hg2bw3XUswRon8c9GYO3jjKKBpmogn3gbgI4y5W
         GWMIT5bwl409JBKswpuy4d5ebbmfd3H3xxjnz/z+D1qcrvqEPNVnWQ4MBXvOLQn+qr0h
         JZJsPqv3ON37cB5OodzMN6e+XFUeo49kegKJ69P3QlobvyXYADnBfCk3Pn138TPgymVM
         iwgyDDHJ3s52fCgcXgfOJlGaEd/bLBp/oPGaOpjc19tc1ZxIw7hIVBmlen41CTZHiZ4P
         KLQw==
X-Gm-Message-State: AOJu0YwrN2vPn8GTChyVz/CPD/gXM1TbkHT96RHCoxcd8QptF58wiBmw
	da7a2E9066iAZF1xvAB3HItbXGBWtD+dshuC6znpyHU5ZXsIik6egFBRX2ra
X-Google-Smtp-Source: AGHT+IFfKGIT+Qv064KzdDaqC3SeZjbN2N+TdHsisCt/BNMiERmnJp6URhc+XvBk9UOYRXt7nbH5Fw==
X-Received: by 2002:a17:907:36c2:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a967bf4e2bbmr316107966b.18.1727787240111;
        Tue, 01 Oct 2024 05:54:00 -0700 (PDT)
Received: from gmail.com ([45.250.247.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299e5bbsm710925866b.215.2024.10.01.05.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:53:59 -0700 (PDT)
Date: Tue, 1 Oct 2024 18:23:53 +0530
From: Brahmajit <brahmajit.xyz@gmail.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-next <linux-next@vger.kernel.org>
Subject: Build failure with GCC 15 in
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
Message-ID: <nffy62zhzazkvivoglq3gltwc4asnv5xprwv466qkgjivzbban@acuemw6yuejk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

While building the latest stable release with GCC 15 I'm getting an
build error with (I'm guessing) the drm module. This is probably due to
combination of GCC 15's introduction of a new warning
-Wunterminated-string-initialization, -Werror and -Wextra

In the drivers/gpu/drm/display/drm_dp_dual_mode_helper.c file there is a
code section on 163

static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =
	"DP-HDMI ADAPTOR\x04";

Its from the is_hdmi_adaptor() function.
I read a little about C strings and it seems like we are assigning more
than 16 characters to the array dp_dual_mode_hdmi_id, and
DP_DUAL_MODE_HDMI_ID_LEN is defined as 16.

I'm guessing this has something to do with how termination happens in
char array vs char* and/or null termination


Some references I found:
- https://lore.kernel.org/linux-btrfs/5mnphkdvheudccjtiatrbjbkqtw54s2wkpeqevj3rqthdqlwyw@sjvn4wn52qki/
- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115185

-- 
Regards,
Brahmajit

