Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE8E1B38EB
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 09:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgDVH2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 03:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725899AbgDVH2A (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 03:28:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14A3C03C1A6;
        Wed, 22 Apr 2020 00:27:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f13so1076019wrm.13;
        Wed, 22 Apr 2020 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9931shIhpoLUFvoD3B+6cYUUTNoPgI67nwzQTsNwhrU=;
        b=BOsjMS1LfeW058K4OjJyGcXb/owDcVYRrcxdC8QoRYU1HSmVnfqRH1PDTkibcmOPo5
         WPdB0MinG2eqHnp+JKxrgsTOCJQ7HOh5qovVRwtHuGU4OH69rBRPOeYs4t/yqWbG7OUX
         2KuGdGSlIh3+ckEETHUtTdUDlXswgziRFwj6v7ISt9TLb3Jq7BlslE96zGEZ6UspSkW+
         gL3ZQA+DW6TerXz9vl3bWWg/sSHqqchiCYgQSbTt6CU+aLacFAwAoTzWYHPW1VD2lgiP
         OvkqO4onGMElOISClpnELl4wVs+oQOICegsnaGersVaIbmadKxFJJ9p1jpJLXRXZm14u
         UQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9931shIhpoLUFvoD3B+6cYUUTNoPgI67nwzQTsNwhrU=;
        b=Zz2N+HHCX4+Ez4Ei+T6B6vK1kEo37oxkd2mP1db3lSWi04mgUchpmAr+JZQFt0IhXT
         u2nfqhMKKIUqR/VuyMyqP7LEahG7LZHrPpPs5mzSeryAoqnIg09eMk+hrEIr+5kLOZJL
         aaJzSK6nIVbKckudB9I2JvgnHFtwUHVEtfwSONBLOGNLljwB408qrqc9IrjHRalcz5W+
         Jf+t3NCKGR4Ysr/f+PRqhAHwhnyg/VWKqxUE94QNOVafv1Zj8e9VNd+7KOUOhyHkzTzF
         7jxG2i10tlYopqKEY0bF4Wvm5LaEZrlRHHvFwRzlep/3mf+h3q6jlJdr++p9GRaIweWi
         XZNQ==
X-Gm-Message-State: AGi0PuY9YT/tgvPX1Wk6qIrCq6kI9u8fV75cyqmZfkUPXyqwyDXtmwuF
        EKZj960PjiDdzBgmI8J1hoVxWoZvzGWXJZdZhdM=
X-Google-Smtp-Source: APiQypKINzEV7SYsxgJrmgOuhh0F/xiiwcnh8jeyiXqLpe/vrgCXa5ob9My0Ccs+1/KDQtU4HnNn1xHd9OHsnRDREDg=
X-Received: by 2002:a5d:4dcb:: with SMTP id f11mr27614713wru.174.1587540478539;
 Wed, 22 Apr 2020 00:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200416094111.3f37623f@canb.auug.org.au>
In-Reply-To: <20200416094111.3f37623f@canb.auug.org.au>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Wed, 22 Apr 2020 10:27:47 +0300
Message-ID: <CAEnQRZDb9N3jiVgHGpvv8Vn5z9LaFEymMqRCMzPUSrz8R3CXhQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tags needs some work in the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 16, 2020 at 4:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   101001652ee7 ("ASoC: SOF: topology: fix: handle DAI widget connections properly with multiple CPU DAI's")
>
> Fixes tag
>
>   Fixes: 4a7e26a4d833 ("ASoC: SOF: topology: connect dai widget to all
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: c59aca98c912 ("ASoC: SOF: topology: connect dai widget to all cpu-dais")
>
> Also, please do not split Fixes tags over more than one line and keep
> all the commit message tags together at the end of the commit message.
>
> In commit
>
>   cb0312f61c3e ("ASoC: SOF: imx: fix undefined reference issue")
>
> Fixes tag
>
>   Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.

Sorry for that.

Mark, how should I fix this. Should I resend the entire series?
