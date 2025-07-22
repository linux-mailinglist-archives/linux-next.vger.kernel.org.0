Return-Path: <linux-next+bounces-7689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69223B0D831
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 13:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47AD03AC7BE
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 11:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E75D288524;
	Tue, 22 Jul 2025 11:27:17 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0B30100
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753183636; cv=none; b=XXormkXYM1NyfLBoOwopXDJT7MyFVmoqHVFWnn9YuZMa8xzcO1NDo5hpyAD6HV2GzrE6s11jUVIfxovYM+YZRHq1uChO7f1lRywGC70k+9WbndFbOsVqjNMcDx4yTE6KOJMIlt6gS1tz/dy2AcmN3+m5k2mZauXrREa2ErAgK7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753183636; c=relaxed/simple;
	bh=M8oY+IWNAgo1/Su5UEqEtQYDdL91oYaaIdj9UbL1+Y4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=R2GRHHxdWVEed4aafUcuiadMNgat66Wb4Ig+csX9X5RQtE6ImRhaXfP7jKtmOjQJQnK7GGpGqMObhOSG+Peji2khbl4QA8YDGynxl0Zy4EREzfJVpHBUz8i44T2BXp/cs/VneYVFrr9/Kvw9PnRI6HAMXU4FZDZc7tTHOuKg+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bmZkr0Tpwz16THR;
	Tue, 22 Jul 2025 19:28:04 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 02CA61402C1;
	Tue, 22 Jul 2025 19:27:04 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Jul 2025 19:27:03 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Jul
 2025 19:27:03 +0800
Message-ID: <687F7586.9040302@hisilicon.com>
Date: Tue, 22 Jul 2025 19:27:02 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: <sfr@canb.auug.org.au>
CC: <linux-next@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, <xuwei5@hisilicon.com>
Subject: Add the hisilicon branch to linux-next
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi Stephen,

Could you please add the following to linux-next?

   Repo: https://github.com/hisilicon/linux-hisi.git
   Branch: for-next

This aligns with the MAINTAINERS for the HiSilicon tree.
Thanks!

Best Regards,
Wei

