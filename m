Return-Path: <linux-next+bounces-4045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94C98BE31
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 15:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1390A1C22351
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A711C5794;
	Tue,  1 Oct 2024 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmVcjksb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1219F110
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727790159; cv=none; b=fLtACJJ7gY/XnIrq/12up8qzMeU7vq20cmP0lm5kMImUG0sHH9zZmygtydK+oe0KlHsY0IVtTZKwrobbWyV2hx0IhfrXwolqyWIrrAnwP5Okb+UN8NhzU2cGj7q2H0WHP/DLQcumkRWuWIbQXr3cbY0FFyMRLP+bd8/5H2OBa7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727790159; c=relaxed/simple;
	bh=cTHc1snM4K++pQXYqWyob40W/F81fYmVWt73pusIbrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1BmT29Z2J3PFWkviYqCCvIYkL8tXIHGFsF6Y+ad562LcTtWU0XzSun+tnEqryH9PLJNLjQBx5ArvjF9Yb5uWgsAcPogFBRrQT7jBDBtQDChjEHnX3tdqcgs3j9OkDYn5yeKOUIomfG8ImNc1RwIVx0o3GnlGfqXgqlA1R7kMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmVcjksb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso843891766b.3
        for <linux-next@vger.kernel.org>; Tue, 01 Oct 2024 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727790156; x=1728394956; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tazfLf05owGDuI0/0AGwuflyXmDD6Q498Uf7b0Dyc0=;
        b=PmVcjksbNx2EWAUjlB/z681GQDWZum9gETZLAt+QNPaOSgLBv7PBaSgGD9X4rkLnxb
         BdvHFyMc/CUkt9PxljRu24w69pcrnbChMuGQja/tksEL/AOw4NLFKyvOGaSD/mm5JgCl
         wRp3x0ls7e9ikKfZRgKFJABJ7okLXRdwclFWBl9ntKU7BlUHx6D1bJb7q5Dvgaf6umKD
         rtcV36PHjndkH/060YY8oqhIwgi4M0Tl1YEbQa0WvMRtrMtnqj5Gsfd+a23EHucI7ghu
         b8EUArgvghp6SeqZQ/wocEUSCw73a/LJRNyruZOOBUbPDj2BHZ0TPFx27oIUB0xuAWwn
         AS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727790156; x=1728394956;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tazfLf05owGDuI0/0AGwuflyXmDD6Q498Uf7b0Dyc0=;
        b=TJwasQYJgNAtsoN4hGGYZkiWCshSBGxXZgQgElCeMEu0dcyhJ/Isa0Lxx5yQNJIkaN
         NuRRjJFWQxLWXSoqnUrgHsgcEJpuerEdCfgp0k+ZXkGDkp73CYScs5RTTeAze20H5VW9
         9pvSy+MeglLvvJ8UFDX3JDJYEvWJgCISYiamElEN+PqmhzOzV2JfW5lZUOszTScTUMJ8
         JprcvxVCejnZboE1414vioRpX/9NpyHnJbw4vRSsFu2zjAWxy1Xfb483gpSXLeqmDutz
         tOTmUm39DG6NH0SnTTF+KuGC3KUS3Q2TbiaqRTpSvZp5xfpNYfjM1HARoO/NHEoeww4Q
         hL4Q==
X-Gm-Message-State: AOJu0YwjCg6JG3TJwd8+0F9dwgHH2y6MRSs8IpdFNVOgptYZ+Cl4wr4S
	FgzUsZHZsO7uem14hpaLguq9tlXUo0hjKto0H10SYe8pH6q7j/PqUOR07M9N
X-Google-Smtp-Source: AGHT+IGoG2nSUAa38yAeeiTnzJCVzOUOGpyEhEjQQSbJnBu5/0e5i6KEqhxTfYiJcvBsNly18hVgng==
X-Received: by 2002:a17:907:7ea7:b0:a86:97c0:9bb3 with SMTP id a640c23a62f3a-a93c4a7c552mr1624464366b.51.1727790155912;
        Tue, 01 Oct 2024 06:42:35 -0700 (PDT)
Received: from gmail.com ([45.250.247.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5a7dsm716032266b.62.2024.10.01.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:42:35 -0700 (PDT)
Date: Tue, 1 Oct 2024 19:12:30 +0530
From: Brahmajit <brahmajit.xyz@gmail.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-next <linux-next@vger.kernel.org>
Subject: Re: Build failure with GCC 15 in
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
Message-ID: <luwsnhcuuv5vzdeswkmtiluxk4oxdrtf7phj4de5hzz4iettm3@qaulgcb7y7kp>
References: <6pg5msxdt2p3ycdamahhf2ojxtn3nnrilzlnqv7zwv6mfzx3gy@k24avbsop6yq>
 <sstecaeritl7w2eu5swqmshi5vbvjpeaufwilqdg2jhtnsnpys@iggjwl7wmibo>
 <Zvv4-bm07rb9rfK_@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zvv4-bm07rb9rfK_@intel.com>

On 01.10.2024 16:28, Ville Syrjälä wrote:
> But we could work around by adding room for the '\0' and
> s/sizeof(...)/DP_DUAL_MODE_HDMI_ID_LEN/ in the memcmp().
> 

Sorry I'm new, but can we do something like this?

--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -158,13 +158,13 @@ ssize_t drm_dp_dual_mode_write(struct i2c_adapter *adapter,
 }
 EXPORT_SYMBOL(drm_dp_dual_mode_write);
 
-static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
+static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN+1])
 {
-	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =
+	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN+1] =
 		"DP-HDMI ADAPTOR\x04";
 
 	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
-		      sizeof(dp_dual_mode_hdmi_id)) == 0;
+		      DP_DUAL_MODE_HDMI_ID_LEN+1) == 0;
 }
 
 static bool is_type1_adaptor(uint8_t adaptor_id)

-- 
Regards,
Brahmajit

