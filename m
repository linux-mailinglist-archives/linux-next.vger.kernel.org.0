Return-Path: <linux-next+bounces-2947-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B983092F23D
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 00:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8AE61C220AD
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 22:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BAB19FA86;
	Thu, 11 Jul 2024 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDBwS3uP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D612C477;
	Thu, 11 Jul 2024 22:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720738128; cv=none; b=izihzQXE/jMrw3yNKhYSDwudbMMF6YVhAfDVC5mjvL8xDTmhP41zEMApqrK+I7VMvQ91WO0RMG19/Nuj90iVYInr1cNTpcYGSWLt2wFkVJkrjIRAYoO2ArNoiofqBt6TijJsJt1UmKHBdNnnvJs1q6IxM2jUjxFbjG6D2CP2ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720738128; c=relaxed/simple;
	bh=l6qknLB3r1VcIgnMjd1fJHGlGy4jV/UXQba43+QufKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft3uknCtPwj4HKePe7rxkd8ag9aps0sGdDG2SqfjPPGisJwsUgqTGPb8bBrm+MgWgD0iqFbd1WEzb/wLmq5ykVUEU2GSHHFa0V8PUg04FPUuEETzkFR92Z+EkEFt/fCp670uG9jGLrIiV8XRC07sKsFZG127Ve+s3m7RU29R6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDBwS3uP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70b05260c39so1055616b3a.0;
        Thu, 11 Jul 2024 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720738126; x=1721342926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFUcJzdDHPjYonTAFX9OO+OO85kdQ7ExODK04DQenm8=;
        b=GDBwS3uPcjwEJ+q2X9/hioj2v63h3+NZPkLuXxFrkIb6xolYz5VfUJ3maTQxA65OoA
         43DI8d1zGT9xKinfCrwkar+EV+MVU7rFEKnqYNKjZI0Rz71H7UqiXYWsjzxN8BiaymlB
         qtwUuRQtIvStG7ug/coKiPJDbceiHxUMEQ3F3lJ2FPJ3XxJEvAKSF2S6vLxgcNoVZmiO
         hlQh6cCPelHmElswXXcDYawAVvVIAh4sjYAnUL7Hqxue8oxQfoWhJj1ekwffkNRu9IYZ
         WbyL2uA0vtQFQVDO03JiQU8KTV9TD3hA1ySHnKnuAcfQHI8/7vfObztEIRYOcNrjK/BK
         hd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720738126; x=1721342926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFUcJzdDHPjYonTAFX9OO+OO85kdQ7ExODK04DQenm8=;
        b=vXtqZJBUc987zf9MFYW3SGySvPIvxHto49Yxlrvshjx0JPI3ic6lfjS04TkptEjzlW
         s5DHNw9hSEvmi4L3qQL87ZioYxdh3pqPPz41itJI+SuSgZTJAwPi+OBzs5wwL5OvuO5L
         C2+XopHpPTncIUwZhXYHj7GliyM9HRuXmwbEosR1VrBCoJNiCHFmTZrqJBqnmOsVXotg
         7Gzm9sDUfFjUjkDvY5aBj5mYfYZJw1zdx0T4ruZYlxymRtl88BdRulUotCEQc1hJ+XKE
         72zeqcSDGJZvG46zJVt/LILsbcMG7ntE0CN9j1CUN+n8U2sYuej+D04VuhaSRwfWmxRX
         U0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNxRMJAwx+YICKkAyPqCC9uk1G7zcXLnfJpW5rEf+GQonQ3AiJMIgtN/53/yY1+VlKpusSiP5FF/VH/m5i1PdyIR+/Ff1FsDkWNQ==
X-Gm-Message-State: AOJu0YyuIDgQlCO25eLTiaHbQqqTE52JLjBDjPkpgjY230gCFhXetA1B
	HGvdq+HL1S6zyqsyMvPJmqzcklLvcPmGTe2yd9r32wqi/p5qZP/2ZPzw4w==
X-Google-Smtp-Source: AGHT+IEwqs7QNiYVGSWxohJ+m6sTbr5AmF230aZYQcc4lWf0JVmFvZCev4dFUUWM9j9EKVY7KerypA==
X-Received: by 2002:a05:6a00:228c:b0:706:61d5:2792 with SMTP id d2e1a72fcca58-70b43538719mr12628902b3a.8.1720738125982;
        Thu, 11 Jul 2024 15:48:45 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b54edb3a7sm3693751b3a.43.2024.07.11.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:48:45 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 11 Jul 2024 12:48:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the workqueues
 tree
Message-ID: <ZpBhTOuSxEYbjjvX@slm.duckdns.org>
References: <20240712084047.7121fa76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712084047.7121fa76@canb.auug.org.au>

On Fri, Jul 12, 2024 at 08:40:47AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   aacff6ebea30 ("workqueue: Rename wq_update_pod() to unbound_wq_update_pwq()")
>   09827e6f1295 ("workqueue: Remove the arguments @hotplug_cpu and @online from wq_update_pod()")
>   bc8d14a48a35 ("workqueue: Remove the argument @cpu_going_down from wq_calc_pod_cpumask()")
>   cbea25234674 ("workqueue: Remove the unneeded cpumask empty check in wq_calc_pod_cpumask()")
>   49d94fbe1f8c ("workqueue: Remove cpus_read_lock() from apply_wqattrs_lock()")
>   e5265846a49b ("workqueue: Simplify wq_calc_pod_cpumask() with wq_online_cpumask")
>   1b366099b179 ("workqueue: Add wq_online_cpumask")
> 
> are missing a Signed-off-by from their committer.

Sorry. Will fix them up.

Thanks.

-- 
tejun

