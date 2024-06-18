Return-Path: <linux-next+bounces-2595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B48B490DE7C
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 23:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6926E1F21C2F
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 21:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D081741CC;
	Tue, 18 Jun 2024 21:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvh7tG8O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A8913DDD2
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718746477; cv=none; b=dEjffqctl243XX3hDZBmKfbeOXDbF6DaKX4zJDCD9fRgwz5vDGiOMxP+f/JBqChzjSAJsEqVcyhDJBzcIUr9LUM0CYaCGMeDicOM4cvq9HbX2diA4XJVjLaYAr1RfMN1Cb2W1ATkzq4d8sP6dhNwlewNW4Q/hMaR23p3XYESYsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718746477; c=relaxed/simple;
	bh=CzmGZx7iOBzMGCMS9hQtf0c+Lf0FgpYWUnocJVwn46c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8dZqS4S4dqqY87qXVImpWjvafJ7gk4/Lq2x29DQC5wbwXmjQy3hhrlwOjFUwERI2ujKa+1wxxVzxfoBR9YtJdO3MwlFAxcDfYvkTc3HBl6rRtJ+n0YbJ+6qs8ROjPXS9kuSyQPRu+6KdeU/O03HRos9VvF87PdmNWMsjbQEQxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvh7tG8O; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f9aeb96b93so15855ad.3
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718746475; x=1719351275; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OAYk5yh/T2BLt+o38zgm7yno0y/23P7B24Iqbqjdc10=;
        b=mvh7tG8OdJkSmq8kiYS3Eo+m03K0wjARgbZJiW81jQpRK9zNpBUmGfmETwAo49tNva
         2JNihsws6qVovksrOeOlPOgb7EEnmKjgYvbZnPVLBTmhyHO555lRapYKWsaDxSpb5jhw
         zqwYv1JrOZeDm5v4to9CpGtWzaGLM2KFdzMx24DD8Jvqc9K8dZBDtOUYMnrZaxvi+mGv
         /oNEUgKyzGgwVCuYFLE2ENOITa7MyM9ba5hfBGiMsgHlmVI6+O593xNUnO306NTvs7Bq
         t5ddVzgjcXWJoO9MWn9/IRFL8tz3F18PsVYoxuqN28AoeJjEPWFd5NrhQk1rDzooXGYd
         RNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718746475; x=1719351275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAYk5yh/T2BLt+o38zgm7yno0y/23P7B24Iqbqjdc10=;
        b=ekxb5phZwSV5Q99or0UV/QJFGfKz602L1QiC8wy/WcmKE+OyaO1zVECh7bxQjIssmu
         0WqCz3TZ2eOi9E84hi0wMoIMEBCX9j1ds0eEVztxGT8+ol+P6u/JtC70GOt4fjnLGsPw
         4YVyYBtHNekHxXTGIybddaMCqf2K88XiALaHwBbzjt5kDLjWiExkfRUl1BUV9JawqgMF
         IgkIljdwhmnGCgXnuXhXoOieLLEmKdws7sSHM3ixay4a7QNgGjID73e5CyunL9l/FC3x
         78k2AUFpMjMK51v4pv2baGHL+jAsNW8XocvvtMumZkpe7ce3uJ7FH431EYI8o9Y+kFjG
         CSsg==
X-Gm-Message-State: AOJu0YxM25FuEQ5qotY1ESAv/3amniR4eXyEtSDcVFDS76kgvUQmYNYA
	7vdCziunotTfF/onlVGaSBLJPi5Olg1ps45MIboerDQZOYKJOXW3
X-Google-Smtp-Source: AGHT+IFfYrTLtQky74OmDBnI/fZtia7sVdcrl2EpLQFPZ/S4egfGojJ4oZZRgVjBjFvvL4mw0De6+A==
X-Received: by 2002:a17:902:e74a:b0:1f7:c41:7608 with SMTP id d9443c01a7336-1f9aa40fd27mr8501995ad.37.1718746474374;
        Tue, 18 Jun 2024 14:34:34 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f48951sm101890835ad.280.2024.06.18.14.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 14:34:33 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 18 Jun 2024 11:34:32 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Vernet <dvernet@meta.com>
Subject: Please include the sched_ext:for-next branch in linux-next
Message-ID: <ZnH9aHFOl4wufXkQ@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Stephen.

It's been decided that sched_ext will be pulled during the next merge
window:

  https://lore.kernel.org/all/CAHk-=wg8APE61e5Ddq5mwH55Eh0ZLDV4Tr+c6_gFS7g2AxnuHQ@mail.gmail.com/

Can you please include the following branch in linux-next so that it can
receive appropriate testing? It creates a trivial merge conflict in
MAINTAINERS but otherwise merges cleanly.

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-next

Thank you.

-- 
tejun

