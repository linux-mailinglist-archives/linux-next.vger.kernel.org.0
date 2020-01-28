Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F66E14AFA3
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 07:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgA1GP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 01:15:28 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43687 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgA1GPZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jan 2020 01:15:25 -0500
Received: by mail-qk1-f196.google.com with SMTP id j20so12259033qka.10
        for <linux-next@vger.kernel.org>; Mon, 27 Jan 2020 22:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=IX6vC1lqC7B6QSvzPSA4RSu0dRAbEMHe13lqUpG29i8=;
        b=VKXqwFjmNXdB/wJW5knEKaf8vqMoxWZxZenXmtRbHfj2GkPH84URj6RIU7kuu9br/n
         cO100UpGyUFr7n85BLlnvIKAGP009/Hcaf4XQmBvgCO4s5t20dg0E/x5WFuF1JfPexca
         qKucwEcgFyhAQqLSQGzAgwSYxg/Krp1wdD+33iDC3XcjfzHjLG/WmY7kCH57ovDlVBWy
         CInbxtz0nSTJ/aPX70647beyykTi1bIki7ecWq/g+4KVqa/PF299NRyKANNx082/SYZg
         a66f6lAnlak0GqZDiNdAB9xuMjwBEyXfJgmNT0Lq1U8INg0B+xHSCqmhtit3iHj6blvY
         73tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=IX6vC1lqC7B6QSvzPSA4RSu0dRAbEMHe13lqUpG29i8=;
        b=Y4ZwiWsSzo4GTAu7Hd8Kmv2pblQv0lsSNc+JWlmQd7ApUSyAv2Lkt9D6Q32XddedYl
         fOM7fqU8DXFBMKu7pywbTqnxtmQPg+LrSkQ/4rAqH/WZCYI6kXnDpWwzStc6mL16Ve3h
         JcNHKoewTdNoo60kHYzeN0LSl9Q95lvp1NobltJPoY70J6Qormcx90iBuleKoS1WgwQ+
         PoPPiPwaGNGZ+wvn/ifWnAG6nhM2zin3w13wNl+I2vAz5Ycne+4eslg/lChzAJzantZQ
         DrAned8MX2pFMGZkcR7jEiJDGkcnCI+rvsiZPJm7f1mr1YFMKVp2MVf2ske1sVnP1phk
         EO6w==
X-Gm-Message-State: APjAAAVV9j3G1i3HGsHzf0U7xGzW/RfpPYECQz038cyJq1B5/XFUTeRH
        ZN55SjFwZYkrE0f9Llf+TKEJgA==
X-Google-Smtp-Source: APXvYqz7X3XsotDyp2Rkn3xurztaEfQuChOv10+xbCcj0AINYcjgBapre5/9nAD2nqzDixYkJRy09Q==
X-Received: by 2002:a37:814:: with SMTP id 20mr20434739qki.314.1580192124338;
        Mon, 27 Jan 2020 22:15:24 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id e16sm11951755qtc.85.2020.01.27.22.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 22:15:23 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: mmotm 2020-01-23-21-12 uploaded (efi)
Date:   Tue, 28 Jan 2020 01:15:22 -0500
Message-Id: <E600649B-A8CA-48D3-AD86-A2BAAE0BCA25@lca.pw>
References: <CAKv+Gu8ZcO3jRMuMJL_eTmWtuzJ+=qEA9muuN5DpdpikFLwamg@mail.gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>, linux-fsdevel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        mhocko@suse.cz, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
In-Reply-To: <CAKv+Gu8ZcO3jRMuMJL_eTmWtuzJ+=qEA9muuN5DpdpikFLwamg@mail.gmail.com>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
X-Mailer: iPhone Mail (17C54)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Jan 25, 2020, at 2:06 AM, Ard Biesheuvel <ard.biesheuvel@linaro.org> wr=
ote:
>=20
> Should be fixed by
>=20
> https://lore.kernel.org/linux-efi/20200121093912.5246-1-ardb@kernel.org/

Cc kasan-devel@

If everyone has to disable KASAN for the whole subdirectories like this, I a=
m worried about we are losing testing coverage fairly quickly. Is there a bu=
g in compiler?=
