Return-Path: <linux-next+bounces-8707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C472C088EE
	for <lists+linux-next@lfdr.de>; Sat, 25 Oct 2025 04:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C639E3AD11C
	for <lists+linux-next@lfdr.de>; Sat, 25 Oct 2025 02:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716171C1F0C;
	Sat, 25 Oct 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="mtbCRISf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789D2405F8
	for <linux-next@vger.kernel.org>; Sat, 25 Oct 2025 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761359411; cv=none; b=qs4XjdXhLgFNBybQkoVQaq1VTOmFdo6zrBarQWKMJ3XIZL/SVv3r1BlX4gMrmShSffoRIi7V6cn2el41bODdJh51U7rC65uE4l6WPFkZDTyax3SRsdd0/gOiNhg/NOj/Nk8Oajb75UYRY8vFOYm02Oie0iVU7iRpmMKfvx40URs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761359411; c=relaxed/simple;
	bh=D1pzp1YPClM00t96/oTqJTRfxWwUr5YA2i5OB1WwhZ8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sQ3uvIbWZqUevPyOZGDVwoz6ZEwFARFTUB77c/Zhj+B1vuNUXTW0ffVsfxlMlqvpf2lXsIQC/7Rrhe11e+6JDpPd5jduvqU2tX5+NO2CEtrYZpynutbA+QjD6U73bZ4JvPwGMbEKzDWc7QklfTtANN2kC7xkGEYddi4WHjeDuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=mtbCRISf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781997d195aso1990297b3a.3
        for <linux-next@vger.kernel.org>; Fri, 24 Oct 2025 19:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761359409; x=1761964209; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eOgn2zH1/O9VRyLAAWbUrXp8HzUQEIIDAyHfM5kcxk=;
        b=mtbCRISfQZk8zsdD6TWvwitRfyKGBiNqmmBOKyFxnfJhQIyWj0q0266k22HyvJzB/f
         xObEDXREEXkv7dc+Q42+v50YY9qKXeLI1NRCeKWgsQlX657SGHvOHEnjeLmr8soBGSt/
         dtMFPl7IqbSGzGPAwwEyoSj+S8WbQfww9ntKlZkASi9ZKvaZhqWc0MaqSX18h1R74Nkz
         lr9hqeg1cu1NkunejmKij0QGgto7grXvjuV038qS3dW2w5r+361I0Be88rLIy9EZmaU+
         XKCdN/Lm0IixdAvqqABaDlJ9WEH6uvKGwK2sL34MBJKSh1oL2OUpMtIUR2PXZQ46i+XK
         z8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761359409; x=1761964209;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7eOgn2zH1/O9VRyLAAWbUrXp8HzUQEIIDAyHfM5kcxk=;
        b=ZWWIbQXGN/YcUkOUY4qd7jIFF1Ftak8vI6FLqt7f3pG9Ybj0G4wWfn+wq1+oKczf2h
         0LiSr+yw5BLO56vtyURKvsWyyphNbUrsQQ7Yr25NYxMJ2XIKT3oa54f8EUwVNBzWTdzg
         1mxkyitWw1v7FcRYjXpl5WI/R9JL9i6IyLWWfGVVvBXS9soIlW9bw+Qdc8YNUawjyH+V
         6ls9M7ZZ6y+0vaKLQAGd8Td0zOJM5PsH5ttgNrECoTLtVLz1YPFQ2Qg6o6v8jmf3UfPg
         aXywWNJ+B+T+EgiYkto3h3OznVdvr18V5hZbtEsqcrCGTQe6cu+68Xqpm14NZ0nPHTIQ
         pJwA==
X-Gm-Message-State: AOJu0YwR8dsCVJAHka/FCiRNsGQ6U696FBaKPlhaNWWpxTJZiUSNo3lZ
	ne8ifWwYbGe1F7G8oKHp5oY0mL8+PUX/YiM9O6Ztnbo3qzaFuOwpW+R9/+XvG25okKmqWV4hl2q
	QlhTmxRk5JQ==
X-Gm-Gg: ASbGncv2OlwW1VIH7yZXoxzVbVH8O69GQXdsY9HuIlaGjMR+pbA9PGXdtUW35+WCdEI
	0LYHlPduPrhTGu7Kyd6OrnWNrTW6oz19F7a43sNipLKQySKx57/sPzBFspnJ2ED63rWcKM5Kg9l
	/XID3mQd7dtiPx6FvTpCOsD4cXMNX24hSwDJ6dPOQFT2nWKyGdZ3pg1PsbBuW/qIoFO+1QA0GYp
	l72sdBASJQ9UOc6hlTGyvp3bCH45+Jh0CUfkfwFn17bxq2p7FQY+u2BKC/BYMZS1Pg5MCnfW21Z
	ck1qQcd9eQFCesdUXclHj9kPxsYafzVbmJfTfriVq6zihW5A68GqAInaLiENN8p7ewmV5HDy0Ju
	6BGQgyxRuV6BWjP71CPVO3KQOAchVP8kuGsEw4YKq0ogOoVR/G83fsgqQjA3xrBTXOIdOZr2+Rh
	9IX8Ja
X-Google-Smtp-Source: AGHT+IH4FKtsJZTn+X8+qz7LeaxG8k7j/XJkvK65UUwcn7KhwAYeZ7eJuzesF6Zjweb6CwhxhQ1rXQ==
X-Received: by 2002:a05:6a00:a8c:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7a28678f84emr5006324b3a.14.1761359408602;
        Fri, 24 Oct 2025 19:30:08 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414069164sm669464b3a.45.2025.10.24.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:30:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 72fb0170ef1f45addf726319c52a0562b6913707
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 25 Oct 2025 02:30:07 -0000
Message-ID: <176135940711.6647.12426098864724738842@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/72fb0170ef1f45addf726319c52a0562b6913707/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 72fb0170ef1f45addf726319c52a0562b6913707
origin: maestro
test start time: 2025-10-24 04:46:53.945000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  128 ✅    3 ❌    0 ⚠️
Tests: 	 4422 ✅ 3017 ❌  647 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68fb155a417a3386b1d34579
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68fb13f2417a3386b1d342af
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68fb1d5e417a3386b1d3637d
      history:  > ❌  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68fb15d6417a3386b1d34619
      history:  > ✅  > ✅  > ✅  > ⚠️  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

