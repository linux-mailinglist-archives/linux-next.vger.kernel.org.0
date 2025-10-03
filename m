Return-Path: <linux-next+bounces-8550-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F7BB5CDB
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 04:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F9353AA4D3
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 02:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A7C2C326C;
	Fri,  3 Oct 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="gPJ0xQ6r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AC151991
	for <linux-next@vger.kernel.org>; Fri,  3 Oct 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759458621; cv=none; b=YvI9Uam2DIU6x7tdfMXOtn/nwj96fqhp32IW+mkzlBbDzYZCLF3rCwTV8Fblkg2FWZZSgvorP9oQHRRoEmiCj5DMUImrGfTK+9LZMPl3T8urk/mWV3VKWsidZh5Vgpa7QYTfPQqindD5qdpAmZTu75IrmH6CZjL2NU3B6pyqL/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759458621; c=relaxed/simple;
	bh=PxAcqIhAxEf4JdP+zKH+mnwvflcyyh/QH7mF8LkRMyk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WczA/wnJbHJFL7X58xcUrIpYZ1PlZRMMPMmQzLEDRQxG+Qq7lGeIh/zQ62RflPknb5rV8KNbg42IuxToW6iQboUHeMZ5JCM19a0c0ZIskox2vBSI+ncFHgnB46/tmegA/oCtKdydYizKQGgy/it1CqlpkmloxounsexaQ6Kkmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=gPJ0xQ6r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-26d0fbe238bso11232685ad.3
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2025 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759458619; x=1760063419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nZNxpNav5hSvL0hCHeeSDSOVt14eXQkeonI7oYiTjM=;
        b=gPJ0xQ6rG+ivq6nsMlHOLZgCseJRgQcDrYNYNYjZxiAb5NPCr6hEaV0NnOvrz4tC9w
         +OrOLJAmVvnXlfD21zsNTw9C0M12nVigkef8fgasNklWiy/hJcvqONfy8H98uF62/yL8
         WKzXPpK6UEhZxmytOP1VFlWJpyU0oLAiIk5IR7Tt+yoeQJD7MyjyWkEswTL57TEgfzJ8
         CKA8BDhIAcWnQzKWXi4NCUHnw0iXB0NM7szsgApfl/Sn4hg4NDuvZv0usaUR+xQMKMX1
         3SqpEW4POQ8UZwCdHdmIniZfC79DIlh70B9QJPmLDhG1ywDo8uvlDKntLF+JOtPm20VN
         ptPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759458619; x=1760063419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nZNxpNav5hSvL0hCHeeSDSOVt14eXQkeonI7oYiTjM=;
        b=MxCIedJcmxunT7r4ezkkkVBCZnibt8J2EHwGtEKWaBurU9CF59DPWFZ3aWOXZ3RF+/
         qPGo9bwMyyXxyGXIsMLbgopTnUXVX+5sXuq+7wXCkQdUU/fVnvHfPd5Q/Fq60MXx8Xmx
         8JQFcflTCu9l6UIj/wWy+UOXl0hnvAF389Xhc8YdYiZSR18PySZND1efNHnfIC+ioaet
         8w0zfNIGzssnNsQ48YlcTGpNS2T1O06WIepJItckcNz2oU29ps1JRs8zD4Gth7A7tJvc
         6t1j4RWrPOGj5njTssfFfURQdBH1dfZlcWgcAWVMjpBYUqokUPXt3kIMSuIfwvCMutXy
         jrNA==
X-Gm-Message-State: AOJu0YzIa262aBPBC3Q3Wx16s+RNTjppVyNObR9Vh55UzB5y1Ad7f67P
	5pDzv6iRoRnVfe1O1B14mH/2bpPjEB9BgR5mI8nU2tJutLkmmEPnXo+OwIDnGP2wlHY=
X-Gm-Gg: ASbGnct3nSJrzLBYraUQSVYfnXpSiRixg0/T+ZdpMH68DSD5fj3eujWmCOUctImWATF
	TH02ATktFhXzOLJ28IueMl8jXxQebOj0Yx4Acs6SXaJ+ol1RGH3qQfhIBVVNW8d1HqO1LD8aM4M
	58g3NFYy77h12YAASEsECWFGT+1GUE97I5NLWfRilfqbLnc6tVHwSdxyaOFF0LdLlFxbJufZc/F
	dVR/0n6XCym1SVE2NT/UGg5LlJ7nuvvjeMwMy0WrlCEUanbqDvdTVeTm3ja+ogunpPR0RxRGT68
	XGtdPa4PSC5CGFR9ZQam+Nyr0keUhbTtfU52kXbM8D8AHBnxCE5C6NY8ybhKBsTTMwdK3Uvulyl
	NRGKeATR593tiW0VUWHRwyRLoB1UbM9viHIDPx9fje0JWfjzZmiE=
X-Google-Smtp-Source: AGHT+IHCDLFmutEzyiKtLJtdqy5W7HEQkXgfvj7ZKZjTna0/A+8fOsTzusvYrfdZ4pRUDBJSY9lWKw==
X-Received: by 2002:a17:903:38d0:b0:25c:ae94:f49e with SMTP id d9443c01a7336-28e9a6298a6mr13929645ad.37.1759458619183;
        Thu, 02 Oct 2025 19:30:19 -0700 (PDT)
Received: from d4e9dbf8e2d5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5674sm34354665ad.99.2025.10.02.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 19:30:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7396732143a22b42bb97710173d598aaf50daa89
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 03 Oct 2025 02:30:17 -0000
Message-ID: <175945861759.115.2409654589054052485@d4e9dbf8e2d5>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7396732143a22b42bb97710173d598aaf50daa89/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7396732143a22b42bb97710173d598aaf50daa89
origin: maestro
test start time: 2025-10-02 17:19:19.014000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  159 ✅   11 ❌    5 ⚠️
Tests: 	12681 ✅  544 ❌ 3704 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b887b
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b8882
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b8827
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68deb9e6841b167e8d3b6430
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68debb02841b167e8d3b68d8
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68deb9ea841b167e8d3b644e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68debb57841b167e8d3b7238
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68dec31f841b167e8d3b882e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test_default_time2_fslimx6qudooac9_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:68dec31e841b167e8d3b87d9
      history:  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68debf10841b167e8d3b7c03
      history:  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68debf14841b167e8d3b7c11
      history:  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68dec033841b167e8d3b7ea9
      history:  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68dec033841b167e8d3b7eaa
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68deb9df841b167e8d3b6403
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68debb20841b167e8d3b6e1f
      history:  > ❌  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68dec48a841b167e8d3b8f07
      history:  > ⚠️  > ⚠️  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68debf7e841b167e8d3b7cfc
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dec027841b167e8d3b7e84
      history:  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

