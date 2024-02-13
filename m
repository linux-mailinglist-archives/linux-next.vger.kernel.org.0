Return-Path: <linux-next+bounces-1150-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED2854094
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 01:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C344F1F2710A
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 00:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D33634EB;
	Tue, 13 Feb 2024 23:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/kw4rJC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620DE634E8
	for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707868780; cv=none; b=UbtGmaK2YUa7a3q2D2QDjEStpq5cBW6E0Hu7+7Mkq77ak+BS11aHFxB62RtI4XAwlf0CeJXIgvMqBKQ8tM2OBeSHlFY2Dw3zLeJtEUUfzIwEqLxYqCqlQ/m1/erOv6Gr5rJ3O+PxcwASWumZcBb1VzJxxKu7p4egnahAaQZTE/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707868780; c=relaxed/simple;
	bh=Ytr20egkB5rUQerCRuc8K2hdcCCQ/nJlnrYqSSyG57Y=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8jHwuGp7JwVcN3Pn94Hz70nSvm2vj2bCaFsMk3girpyNzOQ7aMR1gg289nYSTu5JUkXlEpXHzyqjXfR+iLtVpxv9Zgq8+aHSDDWtU+SjakhMQnZYwpV8Oc9piMNye2lcR2q1evynfbCIDfx0K5XTcoBADojc/neXB9PbggcYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/kw4rJC; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5ce942efda5so3675397a12.2
        for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 15:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707868779; x=1708473579; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhwWHZxcw8oFU0SxEpMu02bELl4566ovMO8rmS9gVPQ=;
        b=F/kw4rJCg/HAQHGLxKAidNSoFzfVLXRIBGyLePAvb2xuzJIG4ZS4el18Gu/YKEwDdB
         wujO+NFaurxHrquFyKCtgfPp20Pf/UdLPP9de2UEMz3fq71Hoo0Tacjes/8lxuSZn6Dy
         9LpBD3odNpokW7/VgtxYYledbExPcyprHt66U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707868779; x=1708473579;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhwWHZxcw8oFU0SxEpMu02bELl4566ovMO8rmS9gVPQ=;
        b=VY7692QvIk3RBnb6w0UXZWgHj56/FsJBz5rlwPKhB4Fi2eRG7H0UbaJCuZ8ylhVJkE
         lG7ujmTGgPAJ244ovn89CNOFjac3j2YOY6qTeY5TKfxRVwJEph3FkroW84ju+3zQKjfQ
         4eXN4TFLQK+BvoGJJOcm9uaqhirJ6icp0CNlds1W/h6JjnrsP4X2QxynMm+jaHtwZM+q
         mdQSWjLJk20lzZQeSx/s+qAYFoQdRoTdyDG2eCD0qpvkLv/Jc7LKzZmXNCFVGXKCVEdW
         AfWyIJ1+uehzchYGd+xLikSDZDgj8bA9hXFKKiSIYyPqTQc/RHJ8HkSgT9h1vdNCY1ae
         I1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX1pgdl+gK6tk3Esc0TTBaofCIEOI8t+ItUn2awOIXsXC6SoiPzkwUQI3TwK7fziAOB7qJotRdHn2yOmO8ivC4yYpP7bJjae0DB5w==
X-Gm-Message-State: AOJu0YwJ/7znhkWut9C7oin/6Gp1y6WV1a+uSNZp8+rH9xgkMV+c2jzR
	VQNL7yCY2+5xn1tAHwm7UOrE7PKPhitKdwZaNy2/8PjKi38FT1SlgARPMOxtbQ==
X-Google-Smtp-Source: AGHT+IEnr/iWneZTItN8heYRhcHe1kG98yemI7ZQwEvTd9fT32EjwfKa29waneXv20dDA1D0WxQHEQ==
X-Received: by 2002:a05:6a21:3183:b0:19e:425e:ec56 with SMTP id za3-20020a056a21318300b0019e425eec56mr1365472pzb.24.1707868778792;
        Tue, 13 Feb 2024 15:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUv5+5LdgK4axTKiAKE8Sd5LVhNu0oEOr2cxk8wq78ciXo/j7hWVJC16nfly7KRm/NegneR1sDwO6UcoNfLx69eLecZqDNP9LDusp8KbffG8jqLtY36u4L0Pj5kRJm4ZbCp+XVdubniEJOcX1CaeT3syZDz4BchQXLpGUjTQiVHKvK1S4sGci+v+AtMAWs7tJY9+AK4OW7CbJW1HNgt4r4X3tn79RgooVJAzzHqCmfYQ283qsHA0zHIUWusHyS7P/zkrXp0XoTrcq5zVKXBB0hH/vaH3cnZEj9FuLjX/biMoC2Mg4T8eiG5HY1wWKQp+mfGYRCSmX3hqj6Ye/Mo+9cXg6oqV0jmnQTS3LUi8EmZSS9bC4qCCqcAPk0cooWbymzgghWaLFpUqtQU9n2C+Fl0F1Qhrsk1XpzWeO90wxA3dCDeIOKtwNmCx4VFMuuTHUsJI1coPeIjlkNWZpl7l0MKeXjVSQJRmG01y6IFfAM31ZvrgYuxDKQ5hKXnA7Zy3v8C5N55q7g50Whx7nBeZ7/Nta97yAZ0FFMA6WA3LKKQG7q6zJH7ENtqHj+aaKBnMi7FwQS13xqpRuMIP4NcTtRfUCNwO4HZcDD1uM88nK2/lwz+o2+34KfGu7rVv915UKPDM/Rm+ue/ibJfjj68/yF4MMaKVZs8pvhVcgZPz4JvpuEt+9J6w7s=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jw12-20020a056a00928c00b006dddf2ed8f0sm7938734pfb.154.2024.02.13.15.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 15:59:38 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Tue, 13 Feb 2024 15:59:37 -0800
To: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Oleg Nesterov <oleg@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Tycho Andersen <tycho@tycho.pizza>,
	Tycho Andersen <tandersen@netflix.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: __do_sys_pidfd_send_signal(): UNINIT
Message-ID: <202402131559.B76A34B@keescook>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240213 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Sat Feb 10 22:37:25 2024 +0100
    3f643cd23510 ("pidfd: allow to override signal scope in pidfd_send_signal()")
  Sat Feb 10 22:37:23 2024 +0100
    81b9d8ac0640 ("pidfd: change pidfd_send_signal() to respect PIDFD_THREAD")

Coverity reported the following:

*** CID 1583637:    (UNINIT)
kernel/signal.c:3963 in __do_sys_pidfd_send_signal()
3957     		/* Only allow sending arbitrary signals to yourself. */
3958     		ret = -EPERM;
3959     		if ((task_pid(current) != pid) &&
3960     		    (kinfo.si_code >= 0 || kinfo.si_code == SI_TKILL))
3961     			goto err;
3962     	} else {
vvv     CID 1583637:    (UNINIT)
vvv     Using uninitialized value "type" when calling "prepare_kill_siginfo".
3963     		prepare_kill_siginfo(sig, &kinfo, type);
3964     	}
3965
3966     	if (type == PIDTYPE_PGID)
3967     		ret = kill_pgrp_info(sig, &kinfo, pid);
3968     	else
kernel/signal.c:3966 in __do_sys_pidfd_send_signal()
3960     		    (kinfo.si_code >= 0 || kinfo.si_code == SI_TKILL))
3961     			goto err;
3962     	} else {
3963     		prepare_kill_siginfo(sig, &kinfo, type);
3964     	}
3965
vvv     CID 1583637:    (UNINIT)
vvv     Using uninitialized value "type".
3966     	if (type == PIDTYPE_PGID)
3967     		ret = kill_pgrp_info(sig, &kinfo, pid);
3968     	else
3969     		ret = kill_pid_info_type(sig, &kinfo, pid, type);
3970     err:
3971     	fdput(f);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1583637 ("UNINIT")
Fixes: 3f643cd23510 ("pidfd: allow to override signal scope in pidfd_send_signal()")
Fixes: 81b9d8ac0640 ("pidfd: change pidfd_send_signal() to respect PIDFD_THREAD")

Thanks for your attention!

(Human note: looks like a default case is needed in the switch
statement.)

-- 
Coverity-bot

