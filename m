Return-Path: <linux-next+bounces-3965-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E79859C9
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 14:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8E341C23755
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 12:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75AA1AE87B;
	Wed, 25 Sep 2024 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="jiGUyduL"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A91AE843;
	Wed, 25 Sep 2024 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264410; cv=none; b=QxNVjky9JPwZAjqT3hTUbCHg3hgwlCIWCi6WCFrh9aemrsgdbnHc5QKYCy8FGiPZWkAlRwWyU2DlvuekoBExJjdxdBfEXBBdv5Vn/R7/9EWSK3Li09JqPyCsjQSqXX7J3ieujvt17aHyDyM9y8tHLYtZkGB/jVrMuKNYMR3fom4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264410; c=relaxed/simple;
	bh=vY5I0kMdI0DNeXj82KWCoioekO4iYLS7wHMFjD9yoTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQSOjvcxEJXUbczyfvDMUeESTk7S3U5gcob2HxLYCvfyr+MiGsFqGOuep3gn9upTJK06b+HVP0a/O8w68C4pQIGwN/g93j1wQ6jfIzkvTCvGITsF0WT9XHQrh4yFMCZb3WglEn17vTDVLsAh4LvAzXmewjJhBcSyeivxQdRAPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=jiGUyduL; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727264404; x=1727869204; i=spasswolf@web.de;
	bh=Cel39kX+t3ozI/7Z+fax43xp/JzTY/67LigXUCbpsu8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jiGUyduLPs4sEonhBUUl+6QXS8W1cO+yAE+KMYLiitz2D8/fy/VqPmuQeBwd16+T
	 Kxm6AVKVL+23Jhb45GRxoThGIXPrf2rufzB9UsSjutdvO/LJA6gLgrHn1OjpQPpqN
	 wGFOtiDnmyfBnpn+WEZ7pHvdylYZFTjpmO3o4/GbgS1cBKSULbydHEU/5S6627RnR
	 n9nyyamjW6Fxzwo3ICRFAKZpPXyVAL+wjht4u4vt1DOP7qqCzwEQk0sggPVy+M4zC
	 pHAFIdXZ2f/55z50utwK2YoK5uYB93XvBxxDxhS4bjGgyVB7OB6PMK+FGSpk/7O7x
	 ljUy1lHOePdO0CnV7g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MiuOk-1sGldI0xNM-00gUl6; Wed, 25 Sep 2024 13:40:04 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: hung tasks on shutdown in linux-next-202409{20,23,24,25}
Date: Wed, 25 Sep 2024 13:40:01 +0200
Message-ID: <20240925114002.3380-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hSRCNJHH8Spwr5XF5MxF2lpR01t2pJEfKFzfTABd3SQGV1WcJwn
 0On+dke3jPfHVq0r/nSr33QF8L+e8+sXwgot9EY2OcG8XzD6wZ+IqUs+P0QA3aL1hirZQ3E
 W5/GOKATultkYfhFCEhJJs+tIHj7zWe06uZivgowyqVOwRv6pU1GELDS7ir7We9xYkZIMek
 JSK/6/1fqgICPHtvQcABQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+RqARRLT8Qg=;YRNrMa18CboZMUxnq2VDw9CI94p
 oUCrh4q+occH26D4ruMi3GpFdwv4nB71CpfVdz46RVJF8pNHDFP144ZQ5sA6wQQ1z6+rQ6ZlR
 4BrxjK7z04bshR5Q3hgo0KDBbfu6eIQSkXwHsgO1+5DVVl2Mid5CBmkBzmUAnGL3Z2GMxkuiW
 xbbrLMAcSCjYeQHlnD5SkArAkmzBxqOV178omdZSj4p4YVj5ncN58W14FlHBRyifslc6vKwGD
 R7LojqaNs5tQ3sk8hcz1Moextqkqg9WrEW9mw5n0doaCdueqN3SZpDxiSVOSBImRPaayPr8Hz
 hRXw3eTSiA30js+MWG3A2kOQ7jzOf3mawrado1pFYAhe/K8PFGgOYMZWjPse513OTeTOKOsYc
 QhLH/LD64VAmIZlpmjPAk9tlDyFqPVGxQbD4gzv0dXbVCXSiYrk+Tz+bov4Xh6zfI6wMQRB1b
 iV/5rPCFsLN3gvf3moeR3GG0ujF3ZMSZvXvu/ANS3/GqHbX2VIg5vt5N15ZyesEYwNHsN2aBU
 xqjZ7RzJOcchebhKjxiF21/EarzAaCCdhpIYtqf4wZqzJOWJElW4fFQVL8pRlsmHjoL8BBhLM
 3Rn98AgMDut8kp2Vw8wKVP6EAgEl8kMI5AoB76PDWzPPQKJIQk4LKM1w7Ir6VsNjwAufp+LuW
 1Kv/gmGjKOCbIwzKKSjk4XdAqtgP6mi34xcMLZ6+Im5O+Ln9VlPAlsylbjDHwGouqTZcFoRBW
 FFnzMgUoC4azpo27/wrYIBBPqFGBJAv9WdlMlbkBJ8cwEBnNy9FxTQzuWsFrUVyFR51VpRPgO
 pLW5E/576bGY0pm9PgDmlSJA==

Since linux-next-20240920 my Msi Alpha 15 Laptop has repeatedly suffered
from hung tasks when shutting down (though not on every shutdown). After
some time when shutting down does not work the following messages about
hung tasks appear on screen:
INFO: task systemd-shutdow:1 blocked for more than 61 seconds.
and several of these
INFO: task kworker/u64:*:* blocked for more than 61 seconds.

The error can be provoked by repeatedly rebooting the system, and so
I bisected the error between v6.11 and next-20240920. As the first bad
commit I got the merge commit

commit 32035d78548754935544d2ae23d39c6090ad0b50
Merge: 9dfe3a6f3f77 6a36d828bdef
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Fri Sep 20 12:48:01 2024 +1000

    Merge branch 'driver-core-next' of git://git.kernel.org/pub/scm/linux/=
kernel/git/gregkh/driver-core.git

Both parents of the commit tested as not affected by the bug. (I declared =
a commit as
good when it survived ten reboot cycles without a hang, the bad commits us=
ually
hung after at most 3 reboots).

The error is also still present in next-202409{23,24,25}. In next-20240925=
 I can
fix the issue by the following reverting commit 1a0f3e00961c (commit 1a0f3=
e00961c
is similar to commit 32035d785487, both merge branch 'driver-core-next'
from gregkh/driver-core.git):

commit 8a16b660bc611a327d5aa227a9dde160e6703faf (HEAD -> driver_core_shutd=
own_hang)
Author: Bert Karwatzki <spasswolf@web.de>
Date:   Wed Sep 25 13:15:55 2024 +0200

    Revert "Merge branch 'driver-core-next' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/driver-core.git"

    This can fixes the hung tasks on shutdown.

    This reverts commit 1a0f3e00961c51edab2d8060b06b1f227a7250ca, reversin=
g
    changes made to d0ba665d37dda73e2ee8339dfad24bb9cc8521f6.

Bert Karwatzki

