Return-Path: <linux-next+bounces-4409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D35839ADB2D
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 06:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CC91F218E3
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 04:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055E016D9AF;
	Thu, 24 Oct 2024 04:57:35 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout01.majordomo.it (smtpout01.majordomo.it [193.41.235.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC3E12CD96
	for <linux-next@vger.kernel.org>; Thu, 24 Oct 2024 04:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.41.235.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729745854; cv=none; b=oOBytKaH9NufengUhp75GkrIQ8goM2/YhLS0bwfvUayIb6X3UtS/a1QFJsXZzUbmaRBzM8dWyaQzrKklNVDxkGTbZTBDTlcN5RwcY7dgatCOUDiXPjMqBuRyIk6JHYYxAuzZNg7giXa6qP9yr60liP24hKUTPC5hkNqOCvfpdC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729745854; c=relaxed/simple;
	bh=dmY9rk98dZYfLdW6bypj0F5XOpr4aOaaiRj/+aGkOfI=;
	h=To:Subject:MIME-Version:Date:From:Content-Type:Message-Id; b=bnAOhC1uEbz7P+VXC9wauwmRarrEZxVA3wBukjco86xw8XenxtioRMImyFzS+BGc9ysd0fe+oFyl64+1/l3+LhhIixklPhXA8lsmGC4TVFsNW5+11RCXNhL4o2GR8Hgjx+qLEYiPyKNN9hH0Vx0E4rPfpORAUEsr/7KqkWb2k0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bonardi1890.com; spf=pass smtp.mailfrom=bonardi1890.com; arc=none smtp.client-ip=193.41.235.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bonardi1890.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bonardi1890.com
Received: from cl8.proton.it ([194.69.192.54])
	by srv01.majordomo.it with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <info@bonardi1890.com>)
	id 1t3pc7-00B4go-E5
	for linux-next@vger.kernel.org; Thu, 24 Oct 2024 06:38:26 +0200
Received: by cl8.proton.it (Postfix, from userid 10091)
	id 272FB102F88; Thu, 24 Oct 2024 06:38:23 +0200 (CEST)
To: linux-next@vger.kernel.org
Subject: =?UTF-8?B?Qm9uYXJkaSAxODkwIC0gVGhhbmsgeW91IGZvciByZWdpc3RlcmluZw==?=
X-PHP-Script: www.bonardi1890.com/index.php for 139.180.186.251
X-PHP-Filename: /var/www/vhosts/bonardi1890.com/httpdocs/index.php
 REMOTE_ADDR: 139.180.186.251
X-PHP-Originating-Script: 10091:mail.php
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Oct 2024 04:38:22 +0000
From: =?UTF-8?B?Qm9uYXJkaSAxODkw?= <info@bonardi1890.com>
Reply-To: =?UTF-8?B?Qm9uYXJkaSAxODkw?= <info@bonardi1890.com>
X-Mailer: PHP/7.0.33
Content-Type: multipart/mixed;
 boundary="----=_NextPart_6ee5af8306120272a45a3eaa9a47bc90"
X-PPP-Message-ID: <172974470306.366533.8975359274932508662@cl8.proton.it>
X-PPP-Vhost: bonardi1890.com
Message-Id: <20241024043823.272FB102F88@cl8.proton.it>
X-PlanetelSpa-Domain: servmail.it
X-PlanetelSpa-Username: 194.69.192.54
Authentication-Results: majordomo.it; auth=pass smtp.auth=194.69.192.54@servmail.it
X-PlanetelSpa-Outgoing-Class: ham
X-PlanetelSpa-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9WLQux0N3HQm8ltz8rnu+BPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xV3WYIDmHRmj++kf4Wt638t8C9mOBdONdnsxgsk1D2pw/C
 h5SE4jAyhe1COeASyU8NetLs4QStcOco0EE2Hm8O4ld5rdi2ZxohSIq+dqifZuwfXg3lLHvg5NA5
 Q4UKfXl4PM708iN9U6KpfdhT75DQ8KFDfFSov9UnEJZieq5dX55vFaTtGDLrs66rBK6J7ISXZXO9
 xjyo6Kp4NQ54uxacnJrgScHt+gjdYMBYQipBHr77E21JwZuHj/4EgBs5dt+mvhtyGa1ANxt3Did6
 Bdyhr6mhkieCfQuTEq9f6FWBUy9jyCbkXtEuyOnFV02lgfrVMDpyOiQ7M6U4823O2v4qPpzTBo2K
 OCA4glwG7eLKlCxkiwuppjVR5L7kHRvOzDqsw0lGtGlBJTXVSv8aSbhq8JNTQSYaKsViRwl6faQu
 oKpg5R1ZvnTdxV3bkDvRbH7cG6hsRQZiAIgw+z837AqgX7ewI8e1h7RITgN14BHmGVt/ReJ9Mfhz
 zmbKTH7wI9GEU1utNskUAORCV2WFZX0jlSB/vGmBNi2FkStbPvS5Il7lLXQUcNAszDsnoUOr0BjB
 2evw9kZekVK4mxTcLS02VIO7W1UXpZJZ4mQdQtWVQpPsKOzu8jnhdIlAmnFG4JAI3NNm+Y5BUKGz
 7XyDEWSpmkEx9fygkPyRsHlSjbWxiJ2Q2y+yxNI0GOi4TAaATn8wweYBsg2bB3JzkJviJrl4Dr9x
 U97s7tij5PRzDTsdWHLYM3A6BXfvel8OEFDbU53mq8N5rOWwgMRtT/G5W5aIKWq/lEMjYa5KP18I
 c+aZKzOfm9hQb4pbvJcb3RcsD/Ol0wLcntSN7c6B5irM4wBzU0HZxhUYw76AxAsHiuxWtnHxRzJR
 npvHucMACjxAXB5kQqHI0C/U3fmRhZoR2Au6WXI+0Y7Ac4HCnAXewFkQxDEvuGslKTrRIXcXpFg5
 ivY=
X-Report-Abuse-To: spam@srv01.majordomo.it

------=_NextPart_6ee5af8306120272a45a3eaa9a47bc90
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Welcome and thank you for registering at Bonardi 1890!

Your account has now been created and you can log in by using your email address and password by visiting our website or at the following URL:

https://www.bonardi1890.com/index.php?route=account/login

Upon logging in, you will be able to access other services including reviewing past orders, printing invoices and editing your account information.

Thanks,
Bonardi 1890

------=_NextPart_6ee5af8306120272a45a3eaa9a47bc90--


