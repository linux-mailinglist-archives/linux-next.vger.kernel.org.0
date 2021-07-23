Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19893D318B
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 04:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbhGWBjX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 21:39:23 -0400
Received: from mx.ucr.edu ([138.23.62.67]:20987 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233171AbhGWBjK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 21:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1627006784; x=1658542784;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=r2k/ZyHXET6YwtDazCGjya0qD1Yvk7/99us7wWTBBGY=;
  b=KskBHZSYzHU+m1bkyU8GuvljyjeWbFepQaHbN2yTHp/xY2972v5hFgav
   S7iwKnKeCfPBLdiunEQY3XR2f508/msTMAGjJWiM6iu8u7Docr5zlA6ho
   ukTZuwkSRl070syGjtz5uWATs1EGdD3VgI1cOVOFYxBnsXtvKCFNfSyQp
   g7hwZNHeizUXpJaRQNYuRstEXcUYh3zXoWX/QkT7No4+b+L4mFP5qGE0q
   yiarBt8JwY9tqmACzV3LcB1SjP/mrM+OEYlu9DV2oQCpvjlwFyG5BSFrw
   nkSfEMlXRWhfvHzQWr7sMnFjcsFD7Vl7jZLTVo5WrLig2fu+VNE4iR8Ny
   A==;
IronPort-SDR: CoIhc8qo9hCU1ZKeIMBTLM3p/YzvSjN2vUfmqyHhmBiMg6So9tCdmGsfLQNCwsBf/in00+snGB
 zoW4HxDtRlY6ZhyGKkCkhhbkcorDaAoFvWrut3/bPQEHN5aDOWrdf9o7Aco1AcUXrwTjcRhpZF
 qhtyCOQFVp4+/nsMWDIdAjWOdFY/IDoqwJINq5rTG/VhaJzhiM4fh/aIYYQVN4nG1YR76geVm1
 +AqlDcWX8vB9N05f2eTlKXmV05SXZfLF+VPCqbsy4oo/pezPskYVH3y5bYD2UOayTJZqIXWqBG
 HSZO6MqJTH+Hwg1ZASJpTPND
X-IPAS-Result: =?us-ascii?q?A2HAAgD2JfpghkfYVdFagQmBWYN4bIRIkWqHDJRSgXwCC?=
 =?us-ascii?q?QEBAQ9BBAEBhFcCgngCJTQJDgIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEFB?=
 =?us-ascii?q?AEBAhABAQEBgQoLWQtjgU+BeQYEPYI4KQGDbQEBAQMSEUsLEAsLAwoCAiYCA?=
 =?us-ascii?q?iISAQUBHAYTIoJPgwgFnGKBBD2LMoEygQGIGwEJDYFjEn4qhwqGYieCKYFLg?=
 =?us-ascii?q?j8wPodbgmQEg06BOIIDRVYBAQGfE50OAQYCgwwckkSLeiuDUaMSuy8QI4E9g?=
 =?us-ascii?q?hUzGiVOMQZngUtNAQIBAgEMAgECAQIBAgECCAEBAo41jlYkLzgCBgsBAQMJi?=
 =?us-ascii?q?3kBAQ?=
IronPort-PHdr: A9a23:gTcK2hxpi+KQJjXXCzLXylBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 hSZvqom0AGBdL6YwsoMs/DRvaHkVD5Iyre6m1dGTqZxUQQYg94dhQ0qDZ3NI0T6KPn3c35yR
 5waBxdq8H6hLEdaBtv1aUHMrX2u9z4SHQj0ORZoKujvFYPekdi72/q89pDRbAlFizuwaq5uI
 RurqgncqtMYipZ4JKYrzRvJrHpIe+BIym5tOFmegRXy6Nqu8ZB66yhftO4v+MBGUaXhYqQ3V
 qdYAyg8M2A0/8Lkqx/ORhaS63QGU2UWlh1IAxXZ7Bz/Q5z8vDf2uvZ71SKHJsD9U6w6Viq+4
 KdqUB/oiTkINzgl8GHMl8d8iLtXrA+9qxBjxoLZZpyeOvhjcaPHZd4VSmRBUcRRWSJPAY2yc
 pUBAPYaMOZEs4XwvUcCoQeiCQSuAu7k1z9GhmXx3a0/y+kuEwDG3Q0gH9ITt3Tfsdb6NKcIX
 uC00aLFyjXCbvJW2Tjn6YjEbgwtrP+XULJtbcXR01MjGB3YgVWNsIHoOS6e2esRvWaB9eVgS
 f6vhHA9qwF3ujWiycMhh43Ji4wb1FzJ+iF0zok2KNC3RkN2YdCpHYdRuiyGNoZ7TMAvT3x1t
 SonybALp5C2cScJxZk6yRDSduCKfo6V6RzgTOacOSl0iG5hdb6lhBu/8VKsxvPhWsS1ylpHr
 DdJn9/RvX4XzRPT8NKISv5l80ek3jaAyh7c5/lfIUAxiarbM5khwqMslpYLsUTMACv2mELug
 a+TbEok++yo5/3/YrXku5OQLoF0hwPjPqg0lcy/BuM4MgcKX2eF4+izyLrj/UjhTLVLiP05j
 LXZvYjEKcgHoqO1GQxY34Y55xqhEjur0c4UkHsaIF5dfRKIlYnpO1XAIPDiCve/hkyhkTdqx
 vDGJLLhA4nBImTNnbr6YLZy91RcxBAtwt9C+pJYEqsBL+7rWk/tqNzYCQc0Mwi1w+bhFdV82
 ZoSWWSRDa6WLKPfqkGI5u0xLOmWfoMVuyjyK+Ij5/HwiX81g1gdfbOm3chfVHftJehrO0WUZ
 zLWhcsBDmoOukJqV+LwoFaLVzQVbmuvUOQ7/D59AZ/wXqnZQYX4sb2T3Dq8Vq9Wb2EOXkGeE
 X7pL93fc+oHcmSfLtI3wW9MbqSoV4J0jULmjwT90bcya7OMokUl
IronPort-HdrOrdr: A9a23:Jnj2G6pHvtAMYsbH4jUImEUaV5oQeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzVHZATBijVQ3+xO/DBPyszHudvj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="227860962"
Received: from mail-pj1-f71.google.com ([209.85.216.71])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2021 19:19:43 -0700
Received: by mail-pj1-f71.google.com with SMTP id s4-20020a17090aba04b0290173b4d6dd74so265933pjr.0
        for <linux-next@vger.kernel.org>; Thu, 22 Jul 2021 19:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5HsahaIutzaQX3vCMZAwzsw9akG1P42X3BuyLwQd9s=;
        b=HIkSG5DNmA6AXtufQIrhGIyyB301lyb66qkwvUmWWk27wMogvI3Mgpf2NToSCC4za7
         MR1CXMdtPaeTlrpgRVFl/tvE4gd4Wijys8PPf9jssKdDw+amjaijroVozS3Ak12HjQf8
         4svfl06BQW0tkRm5Hng0eTnemponrr9stOLex8lPECW8muWuHeG33x1kz4NWJGHKsWo3
         uMlUHknQjoF9HIUaxoBrkS2/vSV9AfYeRAP/HnN87NnyrWy6+ZAPQjN/P+Ps+VBfMqrO
         mycegOQdFZXH3M68uo0sAFGHMffTXijUkPpBos8Oq4jhy4pBHH4XLEb7/R6SB3y4hFRE
         tFlA==
X-Gm-Message-State: AOAM5339iZ4k5ttSyHHf2Y1p0ulnwFR1XzF2djN47VZibFulMcW024DR
        il0d2Zvc0ZmQrcDM+KUnKHUhlT7r27LUowMgNet76ofgqNGEkDPFPJK4ndSBdulT4/TaGAt1C+o
        h8WTQrbH1OzF1JchcNW9JCmzdzV5a2eNWx9pIWz4=
X-Received: by 2002:a63:d74c:: with SMTP id w12mr2766785pgi.91.1627006782724;
        Thu, 22 Jul 2021 19:19:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5l17AKmOZX6WgLZL37UMyq1+sbJYLI+l+EBxxSDbeQUFmfB784kN/6E/+lkE37HoDW3vS+wmwqyPASgz3m50=
X-Received: by 2002:a63:d74c:: with SMTP id w12mr2766766pgi.91.1627006782497;
 Thu, 22 Jul 2021 19:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210723085145.1ce7ee5c@canb.auug.org.au> <CABvMjLTTtAwH7tT96TQ8THkCjTGUe-bMij449UALoyTSS94amQ@mail.gmail.com>
 <20210723105838.613c9020@canb.auug.org.au>
In-Reply-To: <20210723105838.613c9020@canb.auug.org.au>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Thu, 22 Jul 2021 19:19:31 -0700
Message-ID: <CABvMjLS2pvX7L1euq_QF_nt7tq+22p0gahz88AYGRAb8dPb0gQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen:
Great, thanks.

On Thu, Jul 22, 2021 at 5:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Yizhuo,
>
> On Thu, 22 Jul 2021 17:38:13 -0700 Yizhuo Zhai <yzhai003@ucr.edu> wrote:
> >
> > Stephen:
> > It seems you are not in the maintainers' mailing list, should I send a
> > copy to you as well?
>
> No, that's fine, I will get the fix via the maintainer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
