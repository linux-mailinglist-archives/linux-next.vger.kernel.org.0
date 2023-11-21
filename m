Return-Path: <linux-next+bounces-1-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5447F2273
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 01:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87500281333
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 00:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5912415AC;
	Tue, 21 Nov 2023 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H4GHZgL8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4F715AB
	for <linux-next@vger.kernel.org>; Tue, 21 Nov 2023 00:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFC2C433C8;
	Tue, 21 Nov 2023 00:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700527424;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=H4GHZgL8D7ba2KE1pXXXEOwa7HLrehbR7pwGbGUx5S1GmOylVx6KETpASrhI7eaGw
	 WnWyhst3X1BlOuZHwNvf8Tu9bi0hR6hRnFsZi6pz6l0RJkZJdf/U+et7Pl71/+0DeQ
	 h5RjXH8KpGBn8JeCDvtFI3YuJo+2ezZBr1datoLw=
Date: Mon, 20 Nov 2023 19:43:43 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-next@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-vague-ringtail-of-culture-aebcf5@nitro>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

