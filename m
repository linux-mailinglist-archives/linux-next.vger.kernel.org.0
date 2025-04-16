Return-Path: <linux-next+bounces-6269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B0DA906DD
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 16:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA353166309
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 14:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2837E110;
	Wed, 16 Apr 2025 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lOqae2tD"
X-Original-To: linux-next@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4816B2F2A;
	Wed, 16 Apr 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814772; cv=none; b=BHdvy01jSTRKCZaSzB1IzckHWC2UzpM/Dw86/6VGwjk2AxcrT9phIwoRnmAXQOWjTW9jeuPaMr1fg6cWbKq0CaOZaD/drfgzM8RkxiALLVuV7d9AySszeg/WvNd7zNRpXd08dxhoYkuNlmnAgrqWH4BbleE5McSun0fmY7gQq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814772; c=relaxed/simple;
	bh=ui7Cckhd2zl/9mwpLGv7Txtc4zSG4a5R6KRg5miHZos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eqG8l6tALyT8304T3at+Hz3Oeomig6dK1jsybHW7e/3LhIyFzxm+xKZVst9P2PNUbDBSDnDMpFd3okFtA7uJJZmkC2P6f9O59QPpAX2+SVtae/9Y9MeNYSgoGb2S0pnRF+29ciKkp70p9IBOibpOZagt5B/TmLcYCl9Je1YwqBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lOqae2tD; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lN2iV
	L33wu9qpv/0o4THMYGRmulwERkWbPQaO7U+fTo=; b=lOqae2tDnVyOzrX5WpfV+
	rwDzxAlhU4GDuIAAqXL0vgkfVP47UFBl/LJXBfHJfiArYXtJfGK44pAOL5HjMlXb
	doI9rPWGjp0cgE5ZA/KYWMA3Cn/pdC4ndUEg0q5Hy+C5Ppjxa8m+CPMA6DJk/JtS
	pOgQ5jhKe9FKpD1yBZCkGI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3P3Newv9nDEUVAQ--.40599S4;
	Wed, 16 Apr 2025 22:45:04 +0800 (CST)
From: David Wang <00107082@163.com>
To: hare@suse.de
Cc: Ankit.Soni@amd.com,
	hare@kernel.org,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	sagi@grimberg.me,
	sraithal@amd.com,
	vasant.hegde@amd.com
Subject: nvme nvme0: Failed to get ANA log  after suspend/resume
Date: Wed, 16 Apr 2025 22:44:46 +0800
Message-Id: <20250416144446.4394-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <e1f2ac49-25f4-4b2c-b67c-10782b4e3455@suse.de>
References: <e1f2ac49-25f4-4b2c-b67c-10782b4e3455@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P3Newv9nDEUVAQ--.40599S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr47Zr4DGw4kKF1xtw17GFg_yoW3CFc_u3
	y5XFs2ka10934vgr45WFs3uryvka90vwn7Ca1Ut3yfuFyYgry5J3s2vrnxG34fJw1vvr9x
	Gw1DKF12ya1YyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjiID3UUUUU==
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAMxqmf-vqxzbAAAsl

Hi,

On 4/14/2025 4:39 PM, Hannes Reinecke wrote:
> Can you try this?
>
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 78963cab1f74..425c00b02f3e 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -4455,7 +4455,7 @@ static void nvme_scan_work(struct work_struct 
> *work)
>         if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
>                 nvme_queue_scan(ctrl);
>  #if CONFIG_NVME_MULTIPATH
> -       else
> +       else if (ctrl->ana_log_buf)
>                 /* Re-read the ANA log page to not miss updates */
>                 queue_work(nvme_wq, &ctrl->ana_work);
>  #endif

I notice a new nvme warning kernel log introduced in 6.15-rc2 when
 suspend/resume my system:

	nvme nvme0: Failed to get ANA log: 16649

And apply the patch can fix it.


Just FYI
David.


