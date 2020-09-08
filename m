Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C252260D7A
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 10:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgIHIWR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 04:22:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25723 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729799AbgIHIWM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 04:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599553331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wpXz+q9ud+AOPvV34hwZq6iLp3ZbJEEfJ7EHtLY6RqI=;
        b=LIyKGKDT/8npeWzLh4N6YG/2UE82V17YNKI9tAHQfVkqEnZ/8ktwnb39GIBJdAPVVVjN4C
        hlImIISNYcLP9qebUe8zjL5oc+fFr1EMkCP+r0b5cJBJjRzGkSf+G5Kl1nHHJb7lE8BVkw
        36yojQWKc+eF+8cty28aVXVZ/oJm8po=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-evZBP5XRO2Sx-Bs6vNhMEQ-1; Tue, 08 Sep 2020 04:22:09 -0400
X-MC-Unique: evZBP5XRO2Sx-Bs6vNhMEQ-1
Received: by mail-ej1-f71.google.com with SMTP id i14so86215ejc.0
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2020 01:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wpXz+q9ud+AOPvV34hwZq6iLp3ZbJEEfJ7EHtLY6RqI=;
        b=f3h3SuBisdpGy24evyipyPzRcPC6rSRqmDR2MtaeCG0Hvg27rJS99ymT1bbl351Con
         9cNJqDZH3WADN+PQti2W+EYSkq9rf+cF4yusrvpx8s3nQR4Rc8uPJ4dkRjCun8HlfyI6
         PVL2oyENXS18b0v7dsQ/mRX4EVWzChKL78Znzvkw9xQ6e1nNF9qMMiwK0+jPfWLcOdmF
         Af7uPAkK9OlUPFtrDId9ijZuBJp/db2MvldkQJBOY257mFoPh6j4MwrpeskB78dJCywH
         l/0uAHwUiQxE6pc4WAyUj+PbiYqHRVvQgcBHbEmjbZhd+Chh21Y4fBBiIk57gfVlQRst
         34KQ==
X-Gm-Message-State: AOAM531TDQjr3FDK40ZZcflfXmzoDp/XwRX48esivn40Smka8cxCze4j
        +KDzAwiw4c+40UNuemMbQoS76SwPb7oIDGNXYBpxtT5M8CAH+ot6lsx3RJ62fryftj6eW7r+m6L
        dh7bfstpZ3QVvmpLZ9IzALw==
X-Received: by 2002:a17:906:6a50:: with SMTP id n16mr437634ejs.107.1599553328054;
        Tue, 08 Sep 2020 01:22:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSpUnMjZKtgUsJ+BcSD0zVfJfVDHsM/AFxTEzrhyw0d1WYhP2BgF9hcfPBn3/2GC9nlSOMMQ==
X-Received: by 2002:a17:906:6a50:: with SMTP id n16mr437624ejs.107.1599553327903;
        Tue, 08 Sep 2020 01:22:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id i7sm7632087ejo.22.2020.09.08.01.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 01:22:07 -0700 (PDT)
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908140022.67dd3801@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <db369f50-a3a0-2504-0628-ce5e6780d31b@redhat.com>
Date:   Tue, 8 Sep 2020 10:22:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908140022.67dd3801@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 9/8/20 6:00 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm-intel tree got a conflict in:
> 
>    drivers/gpu/drm/i915/display/intel_panel.c
> 
> between commit:
> 
>    f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an external PWM controller")
> 
> from Linus' tree and commit:
> 
>    6b51e7d23aa8 ("drm/i915: panel: Honor the VBT PWM frequency for devs with an external PWM controller")

That doesn't sound correct, those are both commits from the drm-intel tree.

> from the drm-intel tree.
> 
> I fixed it up (I just used the latter)

Just taking the drivers/gpu/drm/i915/display/intel_panel.c contents of:

f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an external PWM controller")

Is the right thing to do, the problem is a difference in a line which gets
removed in that commit.

Regards,

Hans

