Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2EF3D3103
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 02:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbhGWAE5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 20:04:57 -0400
Received: from mx.ucr.edu ([138.23.62.67]:26992 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232792AbhGWAE5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 20:04:57 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Thu, 22 Jul 2021 20:04:57 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1627001132; x=1658537132;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=garshgjdMJCMlsmeozlgmwx58jNaTBUCFx8jv84/gXE=;
  b=HsuB6L1SKB3id/qCAEezHlc/M/pu7cV5i5hKGzWGYgBDGOxxSdacUHBF
   GeU3flTMa1E+PXZvIvm1QAAlkY/AYz6pdLfAPoXMo9s1u8TdX4j2EwXuf
   D0C+Mliuxsws2JTjAXnuFoqIEhBjDxHPSIPjLBmV+0teMIGCJkobvD5HB
   I3wo29RP0CsnPFr/sHBEAx5EeTMOxtlkoYx639nBlJ97I8DRakgeGGeb+
   qeQMyN5oAqcTGypOQhJIIEBaCtNw4R2ZrktO4R19cIck3gYBSbaO05NI1
   TrpMRVS+OMtf5j3PMrovu4hAxcxpuZQQD+nWVbTN+8NDTMOjy6+1BV84E
   g==;
IronPort-SDR: xStzLaobTpxYehsKTvXC5Omljpaf/LLqfJ9c8I7C26l26TJzr4fOYykn/WBzw2mi08IjQK/OcH
 dTxVu8eLIiBTCvEN5FmKUtA+Yvkwb+A80Ik61t7388qXXyU/d5/6ljRHC3soFcxST9mldQ2rSV
 TkLoaDEXFhW+vaT/mUmwPpdG70L2XeLs+Iy//y+XpgK9CvservoSIpj4jwmGg+cTeXiCBbyvoB
 XHwX4OlUD9NzD+lNQ4IuUUEsZp2GxZFBVn919qB/ZIkqqIy8Fywq+c8xXsLKd4edD5nDW8oCyx
 W1w+qhYqGJTz6MPt+5jnAI4d
X-IPAS-Result: =?us-ascii?q?A2H6AwCsDvpgf0jYVdFaHgEBCxIMQIFOC4N4bIRIkWmHD?=
 =?us-ascii?q?JRSgXwCCQEBAQ9BBAEBhFcCgngCJTQJDgIEAQEBAQMCAwEBAQEBAQMBAQYBA?=
 =?us-ascii?q?QEBAQEFBAEBAhABAYEMC1kLY4FPgXkGBD2COCkBg20BAQEDEhFLCxALCwMKA?=
 =?us-ascii?q?gImAgIiEgEFARwGEyKFVwWccoEEPYsygTKBAYgjAQkNgWMSfiqHCoZiJ4Ipg?=
 =?us-ascii?q?UuCOAcwPodbgmQEg06BKQ+BFjg1RVYBAQGfE50OAQYCgwwckkSLeiumY7svE?=
 =?us-ascii?q?COBPYIVMxolTjEGZ4FLTQECAQIBDAIBAgECAQIBAggBAQKdCyQvOAIGCwEBA?=
 =?us-ascii?q?wmLWQEB?=
IronPort-PHdr: A9a23:18QK8xPyiIsrk6oSRpQl6nYNDRdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDv60r1wCCBdqTwskHotKei7rnV20E7MTJm1E5W7sIaSU4j94LlRcrGs+PBB6zBvfraysnA
 JYKDwc9rDm0PkdPBcnxeUDZrGGs4j4OABX/Mhd+KvjoFoLIgMm7yfy+94fdbghKizaxfbF/J
 wiqoAvMscUbnZFsIbsrxBvTpXtIdeVWxWd2Kl+Wgh3x+MS+8oN9/ipJo/4u+NJOXqv8f6QjU
 LxXFy8mPHwv5M3qrhbMUw2C7WYBX2oMkxpIBw/F7AzmXpr0ryD3uPZx1DWcMMbrVr0/Ryis4
 Ll3Rx/pkCcHNiA28GfLisxrkalXpAutqwFjz4LIZY2YMud1cKHActMAXWdOUchRWC5BDI2yb
 IUBEvQPMvpDoonhu1cDtweyCRWwCO7tzDJDm3/43bc90+QkCQzJ3g0gHtMOsHTJq9X+KaQdU
 eCvw6nJ0D7OaPNX2Db96IfScxAtve2AULxrfMrM1UYvDRnJgUuNpoz4Jj6Y0PkGvGeH4eR6T
 +2vl3InpB9rojip3sohhY3Ei4YVx17K6yl0z4I4K9K7RUN0b9OpEJVduj2bOoZqQ84vTWJlt
 Dsnx7EbupO2YiYHxZskyhPCZfKKbpSF7xT+X+iSOTd1nGxpdK67ihqo8kWtyvfwWtep3FtLt
 CZIkMfAu3YQ3BLJ8MeHUOFy/kK51DaK0ADc9/9LLFgvlareN54h2rkwlocPsUjbHi/5hkH2j
 KiOe0Uh4Oeo6uDnbqz+pp+eKoN4kw/+P6YwlsClDuQ4NQ8OX2ef+euizrHs4Ur5QLBSgv03l
 KnWrozaKNwFqqKlBwJZyIUu5halAzu4zdgVnGMLIVBbdB6fiojmIVDOIPT2DfelhFSslS9mx
 vDHP73hGJrNL2TPnKvvcLtm9k5T1BAzwcpB6J1JF7ENOOjzVVPptNzEEh85NBS5w+LmCNV7y
 4MfVnuDAqmHP6LdrV+F/fwvI+aSa48Pojr9KOYq5+TojXAnnV8RZ66p3YEYaCPwIvMzGFmUe
 XrhhJ87FnsKoQc6SKS+k1OYeTVaYXz0Vr8h6Xc8Eo3gBJqVFa63h7nU7SapHoBRLlJGA1HER
 Wb6d4yFA69XQD+ZOIlsniFSBuvpcJMoyRz77Fyy8LFgNOeBv3RA7fre
IronPort-HdrOrdr: A9a23:3hBVuqyygtxYdXiWqcXpKrPwF71zdoMgy1knxilNoNJuA7Wlfq
 GV7YwmPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+ecMbG5t6zHCcWDfOrICePqnpyVuQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="227850660"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2021 17:38:25 -0700
Received: by mail-pj1-f72.google.com with SMTP id x22-20020a17090ab016b0290175f5313b8dso6296801pjq.8
        for <linux-next@vger.kernel.org>; Thu, 22 Jul 2021 17:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90ZPYQIIxrEQ8HDZV+gD6wEa3lFewktyltoq5V1ZqsU=;
        b=esgqWMl4vRUKRqMAe+S2acfltXyLbodz2+j5JBy9QwciorhuZzmCN2jENPiXtN+4GB
         ecOStx6b4C+tXdtJDssISiUjNHBdKDJj2v4KqPzfA8n58f+b3TErbQXVVsw8mvTYTRks
         VUtCUtSVC0CxOUjRV+9NRUw9H8UOAnbsDCegP0qcwkU7ZEUrsrQgOO0CPk2fjPLNx/Am
         6VX0OOqaw6j52QPWDYJIHXL67cMVKRkNUiFEGViYwXFluoFTuZ2pMLt+gZnlCPXuaf1T
         OP5bRcvABbMNYdurzx1JoOtbRuhPr/9DVF3tMM3Xd4/dVu0VRsoA8zWFxZouut/8hV8S
         ECsA==
X-Gm-Message-State: AOAM533f+Ogs4rxm5CjN3hUnhUNbxIveOLyHppLR9LaMgX2QGynQFHXU
        pXdab4g3NaXNK6ubBdxmSMUbjl7IUdlA38kQ9/jToeIjpbxnQEzKNDPnoukk0r6XDPUpPkJQdQ6
        gYOrvD3dCw4BzwH26jldYNnL6V2dFMVKkp9lafq0=
X-Received: by 2002:a17:90b:398:: with SMTP id ga24mr11456558pjb.121.1627000704542;
        Thu, 22 Jul 2021 17:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIHA+T7QwOB27+FG13Zxg0HUbQ8YtotMnwZ+asHHHo2WfeTzlqpgN8f79HzchI2DS3NyN7z9l+Ta6SYXxfpRU=
X-Received: by 2002:a17:90b:398:: with SMTP id ga24mr11456528pjb.121.1627000704061;
 Thu, 22 Jul 2021 17:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723085145.1ce7ee5c@canb.auug.org.au>
In-Reply-To: <20210723085145.1ce7ee5c@canb.auug.org.au>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Thu, 22 Jul 2021 17:38:13 -0700
Message-ID: <CABvMjLTTtAwH7tT96TQ8THkCjTGUe-bMij449UALoyTSS94amQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

All:
I've fixed this issue and resend the patch to the maintainers. I'm so
sorry for the inconvenience.
Stephen:
It seems you are not in the maintainers' mailing list, should I send a
copy to you as well?


On Thu, Jul 22, 2021 at 3:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   c275e5d349b0 ("media: atomisp: fix the uninitialized use and rename "retvalue"")
>
> Fixes tag
>
>   Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> maybe you meant
>
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
>
> --
> Cheers,
> Stephen Rothwell



-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
