Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE1E39298D
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 10:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbhE0I1j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 04:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24135 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235481AbhE0I1i (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 May 2021 04:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622103965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S1BsraUe7N57fnB+ujM6T0UDaX7BExCn8Z1KNT+TQMs=;
        b=RXjtiXvqyxnX/5s1o/35NeA+mIL+xUbRHBsutq9tFwP1ZgGSoHwGACs9zZEfe7cyciPmpo
        aKkHggspD5zQXJVL1G4oBTXBQVenQs03RgnJtZ2D0PZ5dARaM+juFee9am7FfDlO5Os9XH
        QDog5Sq2aFkulvqp9PY5aisX8tUQdUk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-vHUAJV-hPkq81qm71RvVbg-1; Thu, 27 May 2021 04:26:00 -0400
X-MC-Unique: vHUAJV-hPkq81qm71RvVbg-1
Received: by mail-ed1-f71.google.com with SMTP id cy15-20020a0564021c8fb029038d26976787so2094713edb.0
        for <linux-next@vger.kernel.org>; Thu, 27 May 2021 01:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S1BsraUe7N57fnB+ujM6T0UDaX7BExCn8Z1KNT+TQMs=;
        b=l4P3USzDDhLI6WxQagRmnuc6IlhXWZyHSHzHaSVTdvW/X/SN3q4lb94/OjJT2IuRyB
         IA+RS49+wrn0qxp6znle64z20fsu1dqQTZwKlCpAGNwQa/k7zEyu9ojNLMPz2RL6QCyM
         LphjDI7TeU/MRrsgv4TkElHfzgAKiH9dQzUItgNhktoedBP4fM4Wj7koRZjHOYarU6M+
         f75ffdqNGHE6mNwUZ1aXTf5i4E/XwWHn9l+DhSOr+wb9WF9bsCM5xCiwLpE6S2o28MM1
         udjAMZ+d39YBgxH8U7x8ETGtXFVMtLEk8xvZg6z80d/vJaGbCo14yQClld8m9EbK0lWC
         kU2g==
X-Gm-Message-State: AOAM531kZVAxVwuZ5tlcHwg35O56OMEieUEV0WhICks1WuTlWbXuv38k
        C+8Mh+CVwVfLVnfeXClonsIbKNYokDFrOlu0AJGUnnBV6p5Fg8mi+M0UJD4p3zzGa/aPoJ1yrnB
        sRAB4/67MYCyDKhmFxb3Djinq+NQAzEHq7cRKcMyYcksyYxFbAif7DuK5XAIc/+U+DGN1CqPJEQ
        ==
X-Received: by 2002:a17:907:20b0:: with SMTP id pw16mr2638531ejb.48.1622103958844;
        Thu, 27 May 2021 01:25:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWG+hZT0e0LFKddR9ePsHZRRuXayqX4XMSKotQzvDWjtAN99eVYS0eWjYQsi/+6L6jbovDOA==
X-Received: by 2002:a17:907:20b0:: with SMTP id pw16mr2638515ejb.48.1622103958612;
        Thu, 27 May 2021 01:25:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id nd36sm614722ejc.21.2021.05.27.01.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 01:25:58 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the hid tree
To:     Jiri Kosina <jikos@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210527152631.1e70fba2@canb.auug.org.au>
 <nycvar.YFH.7.76.2105271012430.28378@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e5ee42f7-b0eb-40c7-e54f-8e16e8b97b68@redhat.com>
Date:   Thu, 27 May 2021 10:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2105271012430.28378@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 5/27/21 10:14 AM, Jiri Kosina wrote:
> On Thu, 27 May 2021, Stephen Rothwell wrote:
> 
>> After merging the hid tree, today's linux-next build (x86_64
>> modules_install (on an allmodconfig build)) failed like this:
>>
>> depmod: ERROR: Cycle detected: hid -> usbhid -> hid
>> depmod: ERROR: Found 2 modules in dependency cycles!
>>
>> I could not easily figure out what caused this (it may not be the hid
>> tree, but probably is), so all I could do was leave it broken.
> 
> This is caused by Hans' patches (CCed). I will be dropping those today, as 
> the proper fix needs a bit more of rework.

Ack, sorry about the trouble these patches are causing.

Regards,

Hans

