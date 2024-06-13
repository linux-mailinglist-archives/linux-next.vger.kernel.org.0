Return-Path: <linux-next+bounces-2549-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E85907F9F
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 01:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4ECB1F222D4
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 23:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED46413F421;
	Thu, 13 Jun 2024 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="Fn450LZx"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8A12E1CA;
	Thu, 13 Jun 2024 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322068; cv=none; b=rU2yAsp7ZyKgA7hPBhl9c7opVMdB9jwr/SiGoVtJLnwuLDnOnEoTjr51DQ3Ro2eHVYg6QkRCx1vBI26usrKkTurGv19wi1yYJ0IGJtra08omaAvPOQe3FGFyzI/OH3L7QebYe/4b+8Am9QriWNk3hDg1AD7VCTZjb8vNwUuvFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322068; c=relaxed/simple;
	bh=rJH5XYEEQ2rdzZ9NAs5lUd2PQln9UtQS4Dtq+ZGCd/A=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=D/F4qhJl6TQ+T2rIt8lyR6yyZLmsXanXaHKNRdapZpbvTx1grxh7psw40PdhjODFt/PtbF+lFHcQwqnmE3vY9JOlX0DcL/M4OLnFhI9G2OEnc5fAogWqCJL1Yot5SugSfQkQNJaGxdIHSUKuBBw06nwdForRbsXyNXplCmYUWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=Fn450LZx; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718322056; x=1718926856; i=spasswolf@web.de;
	bh=A4iS7SnFzYQOWLls9ToE2MWXUz1kLfgULdeHOJvJs7Q=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Date:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Fn450LZxmiyvXFcqhS/ezmwmMP40HIxgH+9T5w8GvIzVVGcP8JIcey9NkvImQQ46
	 J796SCTKUlpCj5KmV/rLSg2KRgNsd/KDsvU34uHExsFnsl+XNFtTHy5Yf4BF/A0P2
	 oFKsyDrifMwrnlBB0U49BrivkjG61v+Af5wFEZ1/viPas7tWIJf7ptlzjJgdjRevz
	 LtBzU5vq8ph+5CMT2QLOBrel4CgHyTr3vlwR4AAlErXzJEg1nQLqKz0kKfS2QxOLG
	 p3PCRDYYl66evajiLoawJ6deYk36VwEhsrlC3wf1tlQiLmb9R26v7YknM0HdrZ4oi
	 yvtafh1x7SED9tvj1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8Bw1-1sLUZH1AnL-00G9CC; Fri, 14
 Jun 2024 01:40:56 +0200
Message-ID: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
Subject: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
From: Bert Karwatzki <spasswolf@web.de>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	linux-next@vger.kernel.org
Date: Fri, 14 Jun 2024 01:40:54 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:p7sdNQFAkJeMigdIoUg/J5dHLO/S/IikzRRthlWOxaX8SlaCiIv
 N7mI7hpBcgZb6yYH6vlMBekap4UH4IdJRhysy6dEpK8prk2n4vHJ3qdHHeqDqCV0vdOl0m0
 f8NWhkNHVKZ3liVQcypF1H3Ymtvh/wZlvNbyzBbISvzpZpxjBdqeZztymzrm0sp//nIQ9/d
 ChY6OjGRiWJR7rDwTygUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o0ZBZYDwGvY=;dUo3B/6dqNV4vFFkeyj4nLZhgzm
 ENDQKnvvYZRaEkzBnI7X8+ydESLF5wWHDTNuR6n7S9WW+cCJ7ipUat6Ucf5w47aIU6kOEKibg
 4fD84Pp/ARrbqk+4EA15AwwwZAqIHO/pOgVSmV5BZ0RhK/U0nPRr+z3ZDzyXC6F1l7rw8P104
 9VLSGhKw4xvaIiuGmxxpEp3VippWU5hT7lSRziTZv7RQr9uEz+INC+UdY/gVliIIaACrdF+Y5
 zDSqrCRtAUGzfW/sGHs0dAEjXI+2vPsZ8h1gQ/L3nf7NO8F9oiBAvqgQ2YdaagzKV9qbsj7Qu
 Dxk1fNsyGsS7MZvQ4QfM+beQq/cwrafPJZQHq6IUTSME0C4RcGg7sci9CeM1KIAcRh/DiXZc9
 vMg2Wgl75lyTELrvOcaPcJeNqKq/Wyg5BwdJECQLZLUNmPEmiHhR6MmYkdEq1iss+OmoHA/Ho
 tICIaRpIAql9BEfpppIbEmJuyUB1vZjpYq9IDJ+xf2igM/7nCVkLioN4lvWjDfn99f+SHmF1r
 oE2UE4t3cTNgb/b06FKLxTBfB1LQr2ew50ZcB5DoQ9AsJRRa8ZSHavyf7gjif1MO1P1xFobbF
 fH5xRYpevoScKQpkXq4NeIQs/lSyQ0FQ1lNFQCCQCPKbr4hnO+TJVJcku9S2Om9uo0IXLMKrT
 5AvJe1K46oNfu1WOP6meY94E6XoU61T25lXAvXfkd2VnQTxVODrGdT09hoL0cU1u6UkhmDjBW
 XixNhbEyd9rJT4gLPaUng/dJbRgAj480Lx9BPtqxpX9C7ayh34dEI2wfUOkTPrpmYWCHcwnCY
 ueUEehsoMou/oeexbJyNmR3/wkh4ji/diEQW7NXbE0Y5o=

Since linux-next-20240613 firefox-esr crashes after several minutes of browsing
giving the following error messages in dmesg:
[ T2343] BUG: Bad rss-counter state mm:00000000babe0c39 type:MM_ANONPAGES val:86
[ T4063] show_signal_msg: 16 callbacks suppressed
[ T4063] Isolated Web Co[4063]: segfault at 396d1686c000 ip 0000396d1686c000 sp
00007ffd767b30a8 error 14 likely on CPU 7 (core 3, socket 0)
[ T4063] Code: Unable to access opcode bytes at 0x396d1686bfd6.
[ T4211] BUG: Bad rss-counter state mm:00000000cd9fc541 type:MM_ANONPAGES
val:817
[ T3798] BUG: Bad rss-counter state mm:00000000432d87c2 type:MM_ANONPAGES
val:181
[ T5548] BUG: Bad rss-counter state mm:00000000034aa27a type:MM_ANONPAGES
val:242
[ T3823] BUG: Bad rss-counter state mm:0000000099734197 type:MM_ANONPAGES
val:137
[    T1] BUG: Bad rss-counter state mm:000000005e5e2f2f type:MM_ANONPAGES val:28

(these are the error messages of several crashes and the error seems to affect
other processes, too (T1))

The crash can be provoked to appear in ~1min by opening large numbers of tabs in
firefox-esr (by holding pressing ctrl+t for some time). With this I bisected the
error to commit "1c29a32ce65f mm/mmap: use split munmap calls for MAP_FIXED" and
reverting this commit in linux-next-20240613 fixes the issue for me.

Bert Karwatzki

PS. Please CC me when answering, I'm not subscribed to the lists.

