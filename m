Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7A2CB781
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 11:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388327AbfJDJmn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 05:42:43 -0400
Received: from filter02-out8.totaalholding.nl ([185.56.145.240]:41061 "EHLO
        filter02-out8.totaalholding.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388326AbfJDJmn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 05:42:43 -0400
X-Greylist: delayed 1156 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Oct 2019 05:42:41 EDT
Received: from www98.totaalholding.nl ([185.94.230.81])
        by filter02.totaalholding.nl with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <mjbaars1977.linux-next@cyberfiber.eu>)
        id 1iGJo2-0002fc-Sx
        for linux-next@vger.kernel.org; Fri, 04 Oct 2019 11:23:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=cyberfiber.eu; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Content-Type:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7fbCrmBoXH7A68+AJFpjQq9ukOe3qj5mwDOpBcXgXcg=; b=rdtkz220We4qcgJCu+1EVpAckk
        0XDHQRgGJXLcw8BYIDYzqJ2f8gwloXaxmcQdg5gKEqUkpIANemmBLmspbrCka4DZvE7nmYBrR+XZd
        +cszBQqHdWWXK9til/Wvv0FKsnqdv7PatC0Y9gQOBzhuV70+ZTPcfAeWA2flBKWxQqoWnu86MZXV7
        m7YGH8WOIolmg657n2EzIsWtb+8AjjUMhKd8lnCYPunS88b1LH8mD7p/q9I6k9g3N43EW4fkGhg59
        3OdJs/e+CxT+CiXZJofLgIaA9gH7sGARue7YlumyjfBBIg+iFNXfROdeFHSq0+WOOVjhJihhQ3HBM
        i1FJmYLg==;
Received: from [85.146.134.134] (port=60956 helo=DT0E.cyberfiber.eu)
        by www98.totaalholding.nl with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <mjbaars1977.linux-next@cyberfiber.eu>)
        id 1iGJo2-0008OY-L0
        for linux-next@vger.kernel.org; Fri, 04 Oct 2019 11:23:22 +0200
Message-ID: <934a5845ded847cf60dac29e2c3a1617a19b3d64.camel@cyberfiber.eu>
Subject: packet writing support
From:   Mischa Baars <mjbaars1977.linux-next@cyberfiber.eu>
To:     linux-next@vger.kernel.org
Date:   Fri, 04 Oct 2019 11:21:55 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www98.totaalholding.nl
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cyberfiber.eu
X-Get-Message-Sender-Via: www98.totaalholding.nl: authenticated_id: mjbaars1977.linux-next@cyberfiber.eu
X-Authenticated-Sender: www98.totaalholding.nl: mjbaars1977.linux-next@cyberfiber.eu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Originating-IP: 185.94.230.81
X-SpamExperts-Domain: out.totaalholding.nl
X-SpamExperts-Username: 185.94.230.81
Authentication-Results: totaalholding.nl; auth=pass smtp.auth=185.94.230.81@out.totaalholding.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.37)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0dWQ8c9lblW44odAlK6ziUapSDasLI4SayDByyq9LIhVP66eIxt/agQ7
 YJNlpgi5CETNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD/9Yuy3KYgr+Xp2lc9a0hJ7sr
 2GHY/oPc/Sj6e6fjMOPgo34CxMJsfFVRRl+N7XQzmXnwhqV89j+ARv3NGrLs3kMC83EcGqebH9oT
 x2HeTuILR/OCcSqBov/It9VLTwUtrv+pZZzPuZzbY05EgKH+54fnWsapW3z1QQl3WNCoCmphaO8/
 sOLGxvPra+IE2VKbtzq59/au6FtVBedMcMZD2A5Hd7h9hGs2mMcr3x3SO+pXbzlGDgc9XtezO1pp
 lbxgGSHNUkVafzzty3Q0VecVYrGcaaIjen00R3K8hqLVEDcU+jrswQO4AAsFTbbIVN9OMUuk9DZs
 ZpqJzTu4ne9fIW0ADRQhigebWDCAVyBhr/gLAao5RzCtd/nkTxNvxuZerjIfxK2tug+mEO2au1ST
 Cc3eBlLJqiVJPtCow1pVL1V7WnZqdehUBKWOp7GmInPfES6o0yXgT60woyy/8De7jEVHEX0tIc2x
 kWXbaWtFGf8fSSeUyA5BNWn7HV+jYQ+bVT4G85lXur5hVI3Z8foXnVf9Vd2T5QI8ff10PFzAgbyJ
 0Nnn2sZ1nGst2lLXazFNB5hQ6nsDvccjqgmDvD9WhzAER7g2G8z0vMWHYSWP2VCAznIPNy1x+BpL
 IAn0yEOeEyoAEK4rsNWk4mvtBc9RUfhdLFqBNX8zkMg1sqUaz/h/E4bDGGfzOBDpjoLOH1aST6D0
 Hfbi+JZPjT0BtVpoVVnyB8MNWqTFU+x0wQpRLXlc9aUV1oY4fX3W5eOCNA39T9/S+3wUwf6gVwRX
 kb7ZVl+TPyZHjLL+fsezOSlHiN2zbLeFB2C3TRK4CGine+E0PT3GHMoMu2KurjsSRYS4O0Om5MJs
 NiB4Ja4rBCoIUVJqo0kiTjIa3bZbVa3eG0jEwKZ6qXaLfeWdbNmwcH3Zv05iItngnGtKCK7/QYhi
 hF8WumrheXPlCKfm44anJHbHwaJ1B18dd+gi04XAFYEvGg==
X-Report-Abuse-To: spam@filter01.totaalholding.nl
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

If I'm correct, packet writing support is going to be removed from the
Linux kernel. Is there any particular reason for
this, as far as you people know? Both DVD-writers and Blueray-writers are
still being sold to date.

I'm currently working on quite a large project. I would be dependent
solely on USB to store my backup files, when the packet writing support
is removed. Actually I'm quite uncomfortable with that idea, because
USB is rewritable. Any serious attempt to do damage to my project will
result a permanent loss of code. Personally I would do anything to keep
packet writing support in the kernel.

I'd hoped you could remove normal floppy disc support instead. That
seems the more logical course of action. Floppy disc drives aren't
being sold anymore for quite some years now.

Anybody there?

Have a pleasant day,
Mischa Baars.

