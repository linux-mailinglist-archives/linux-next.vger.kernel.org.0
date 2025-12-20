Return-Path: <linux-next+bounces-9495-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C63CD25B7
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 03:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD89E3016CD5
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 02:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E973A1E67;
	Sat, 20 Dec 2025 02:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pEv4pfRH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA643AA6
	for <linux-next@vger.kernel.org>; Sat, 20 Dec 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766197826; cv=none; b=DSD3lHcdNGapYVsfleUr85Z7mE0mFM5KKRE7gsFGcoMdKWKKA5/WkI9XJgXxh5bkqygiNTVSaScWmGU+h8hn64u50gakoq3eN8KSyltlATxhIOLcctwpJFpMptZOyFx6F/ROMU3Fb1GAj47tMU6cixNyp8lDQtJxCJMJn528xW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766197826; c=relaxed/simple;
	bh=7SGMw99fLZmsDIwSKqhIRktNUsOPww20Q3HBApYT3Ao=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=fReIxBWwvZzBS8og7F/HkGzHjZiGrE8npmvLRzIe1LGalQmfH6m1KMQS9FUmIRRBFNvLsKHuaE/WLv3FxlbYk28NyPhIiYI4S8pUNI1YtArBWVZQQDrm4rXxu2kVep4Pmj96VTzIQgjOtz+h1i9SOJ3c99PgWFUtmWpYT06D14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pEv4pfRH; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so2795078b3a.1
        for <linux-next@vger.kernel.org>; Fri, 19 Dec 2025 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1766197823; x=1766802623; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0h8VsFmSH9FuOqi2Z4wxp7Aqdnp7KEJ8yjgCKjrtFE=;
        b=pEv4pfRHOhjvMAkWHgW7Hzvwe3oLs2AglqktLV8LohzPq/Gx0/Ej2EwmP/vk5+yZxU
         q3VxE3e9Nd2r/r7+0t7PrBCRBbjYHnPso4iakr1pUMJkGmqlphyd6uVS0jXgEsQNP0lM
         aMYs+Yh50oEnLohWLDCV93uO78WedXUW7PKvT9i0TZPxpHci5MBFiUWe3bU/5h8Kyc5w
         ZIE5wNhbvlN1J1hsQuwhciCx/duXSF7jTjpbceAiAS1ftWgoAWes2JITnCIWh8Fz5NGo
         msmUSMtsaF9bwKfOpR/P/qUvPk2YzW7bm2llwu5lTrjCGQg1f0SdJjdwJQ8EGcQjB5BR
         4LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766197823; x=1766802623;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0h8VsFmSH9FuOqi2Z4wxp7Aqdnp7KEJ8yjgCKjrtFE=;
        b=mGHlK1lMxI/biWOa+FESL8f+GxGWWv+baPR8DSRkrFyYVoM6wQBoMh5CWzyoRapbny
         j+jUCjoorZucSbV8bp9vzDI0BV/iTQeoobvwjvfLENFuuqkTn8M9nOkRgMngRidx/oi8
         q5JVew6fr6fDKX8pWyOhGnxBJGmzpYQ09wd1nR0oAAeWNgrKyGMmoQJAAupdGAqETFsb
         QZ8HxdTRC1kuxY/g2dCktMGRUvV2N6+/Qa/S+6kZD4+CCpKXMeYCmxOfNBJRDYiuYgQ9
         xz3hiN/TbF9HaqfiC/pASzECSwOFR5J+5tYVZuSNvWf/voY4wln+rrfZWquZca0+h7Oc
         JsVg==
X-Gm-Message-State: AOJu0YztEJPnNu4/XJ2F+4QeyUALWy6WMKwXFcIxsSHujsBeXQL7e49j
	mGP2CVi7ESn4WKso0XxMDpJVqJltegM35fYOpX/4HjLjfAZsALWcvrl0tAwv/R5xIXpRcqr+YBS
	YrsmdqCE=
X-Gm-Gg: AY/fxX6h1C0WM2EBqbpf02NecJ17ForLbOo3N5X6sSAOeq4hq5SPgGQtOI7n2ij6Bid
	+IitgWCyxVYMKnoVgRQa3ZkOgfzLW3/F/zSngzXaswg8eHWzDAL/nmWyRt3G+ofEwjI+FkONOCe
	lyUYuFfblBgxdym+EPKd3pkWZ0EjBpnc38KvnfnUdBeko0S6JBaw/OaanquSNQv/geiL8E7uZXR
	m0+XDHncbAGcF8D5JO5muGS3JKlHZ/mB9nD8u15YaVmG0K2GKoVHTFt1Yswb1ekOWG8ulTSovEd
	u6L5kk5YXoFWHz/W2nVWKMYNhd+2igaRfG4i/k+GmugUqUCK8Mu/DGa7x7PUYpWPDYA/B4ldj1e
	r7ZukgQGgEOtFkw4J9N4XRRVVn01CPbkOo2cbHxgUvGW9l3tgXfViPMLQd8cSl4lp3jyv4XSMJx
	og0fPn
X-Google-Smtp-Source: AGHT+IE5rqRT+nlY48sz9pvAxLQYodmWQWDp3CrsYUVjFhPqcjfDI5Ym8jc4ZYrdXal/TTMA5Rol/A==
X-Received: by 2002:a05:7022:3b83:b0:11b:ca88:c503 with SMTP id a92af1059eb24-121722ac49bmr5402979c88.3.1766197823112;
        Fri, 19 Dec 2025 18:30:23 -0800 (PST)
Received: from 0dbd87e801fb ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm14492846c88.9.2025.12.19.18.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 18:30:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 20 Dec 2025 02:30:22 -0000
Message-ID: <176619782202.1167.11917208872224861355@0dbd87e801fb>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/cc3aa43b44bdb43dfbac0fcb51c56594a11338a8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
origin: maestro
test start time: 2025-12-19 03:19:36.380000+00:00

Builds:	   49 ✅    5 ❌    0 ⚠️
Boots: 	   38 ✅   83 ❌    0 ⚠️
Tests: 	 9216 ✅ 1030 ❌  999 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL-Gst1-0.SAO_E_Canon_4
      last run: https://d.kernelci.org/test/maestro:6944d2f4cbfd84c3cdc16d71
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16096
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16095
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16094
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16093
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16092
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16091
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16090
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc160d9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16047
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16046
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16045
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16044
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6944d10fcbfd84c3cdc16043
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6944cbc2cbfd84c3cdc14fcf
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

