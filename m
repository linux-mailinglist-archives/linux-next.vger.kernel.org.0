Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0976BA5C08
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 20:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfIBSHV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 14:07:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37744 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfIBSHU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 14:07:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id d16so15474731wme.2;
        Mon, 02 Sep 2019 11:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2FP61o/rTW3HxqMEgs6ZmsTW0Pzgbyx4HaATesyroRc=;
        b=HBBXjVcXyPoUX9Asnc9aIZcuXAz5XCTn37veQopKqIAVof3qtxqVYmqKBc2B4Ppra5
         Y58KTaTk/nF08+uUkUU/+oSEPovt1UF2SY74JuMgjhCYqQP3vPUk3tNXnX25OXyP3esb
         /bHFrxNIbLm89dE8OnG9Yax/CYvaVUJ/odjkWKvIBTBY26zjskZ3yvtJadNMOQOCL5rx
         BV7ZKOitDRacIBTt2lPx8WSzEDmAowxX88zc7+zjgdEwE4Jr0bGVd68DWZRW5LZLfaI/
         /z1i1lpLvxBu5Gt0B1Df7/X345wvA04TXZWDWQzjtLCWEkFICodhFOq7Lu3KJVrUIARb
         TK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2FP61o/rTW3HxqMEgs6ZmsTW0Pzgbyx4HaATesyroRc=;
        b=OpXfRFt23TagndtsbEZ8Eq0nxAVXRFdDj6zOD8cstg0gqphJVrtOgkkI7URcQwtzl7
         OTXavhGfw7L1+y0/aX6to/yzPq0VRzXkYo8emtwKb177fj/Xftv3zkGTgNhVyCE6LMXp
         GModI5/57NHkfxb6mjw8kPCL5tDNgSQTIbu1s0mD4SbW71c+2W7j2i4AyuoM8BnK2AbK
         2khtjiyrBmNUROr1fA4OJhKSX4ibvqJGVESjaUA7mqovidnMtO5sOH6ZvZe/+rA8HmSC
         QOid3oPIpBo9OqNus/NujvMB8lJ7OLvDuaoCvoh9VhBLha8vdify9hP2NpD5B1smlx9L
         4OqA==
X-Gm-Message-State: APjAAAVVCg/N9kxRGAlCjsDYvVCdYd4rP1CSCH58De/xTPTKG6L/GLuK
        xIjXIgsfpsPCubrLwzYjZj0=
X-Google-Smtp-Source: APXvYqw1iHn46OE2NUICV9iUJgJFO0LHiEfe7scxyxXpgXgJ7+0k95/PZgmSBwtfuREkAbfiq2gXCQ==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr4799177wma.10.1567447638782;
        Mon, 02 Sep 2019 11:07:18 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id t203sm16421896wmf.42.2019.09.02.11.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 11:07:18 -0700 (PDT)
Date:   Mon, 2 Sep 2019 20:07:16 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Len Brown <len.brown@intel.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20190902180716.GA34219@gmail.com>
References: <20190902173102.53a44459@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902173102.53a44459@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   tools/power/x86/turbostat/turbostat.c
> 
> between commit:
> 
>   cd188af5282d ("tools/power turbostat: Fix Haswell Core systems")
>   b62b3184576b ("tools/power turbostat: add Jacobsville support")
>   d93ea567fc4e ("tools/power turbostat: Add Ice Lake NNPI support")
> 
> from Linus' tree and commit:
> 
>   c66f78a6de4d ("x86/intel: Aggregate big core client naming")
>   af239c44e3f9 ("x86/intel: Aggregate big core mobile naming")
>   5e741407eab7 ("x86/intel: Aggregate big core graphics naming")
>   5ebb34edbefa ("x86/intel: Aggregate microserver naming")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen - I resolved this in -tip too, this conflict should not 
trigger anymore in tomorrow's -next integration.

Thanks,

	Ingo
