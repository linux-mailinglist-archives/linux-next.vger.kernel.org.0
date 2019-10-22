Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995F5DFC81
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 06:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730890AbfJVEW5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 00:22:57 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:46184 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729133AbfJVEW5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 00:22:57 -0400
Received: by mail-ed1-f54.google.com with SMTP id r18so11724543eds.13
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pZNr+QmFTBoGr+KhftMcyPDrQ9zV0q8hysnLkcRRblM=;
        b=MxODVcGImdVihILyCGjv7+gJh/FZalp7AxrAMC0aaB+XdYGO+emu3L2p09cB+keGRV
         ggOrRLed22HERyAo+B2f4a/p5y3TyOmaJUM/7wc+drhUPhn4A3gtK+S0VzWHvwT7u6Ln
         E4SFxdOU5co8n5jyu5bI4gcZYRZFTdZcxH6W2HJ2PRsEkl6/FI6llEJ0eWT6DiFbvHum
         x3Q7z9O+9yNzk6Mwp0CF8QzOZs8VSbBcGZFqKxQhGn6zwxMGdbqfqtYFODTyoxQgNA2s
         QE87ait0O9on1Jsnfaor+YHwRCJJBW0BPb0ADHC0xi61lnmN3FbaPM2VOJU2PuEj/8K0
         iZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pZNr+QmFTBoGr+KhftMcyPDrQ9zV0q8hysnLkcRRblM=;
        b=F4jsRdYMU2HASUWVma2fFPcWNuBICA4vMNoTOin26FEOwqq+aHA7FqxfrSx6vkZKCK
         A3d7yQsYJ3wZoL/aT2Sfm4W5x5yETA2jetpO8Ng6lGo4pkkYDy6Oz6cTbwE7UArdzAqz
         Qw/eDQNClrmnNemS8g3SgupbogecsTri28JD6J5CCDLgw3q34X7oU7wZOJUhH5sy1j35
         f4zmG08zMaTVmq+nAs2xM+OkE6dQN8lL4wKG7E3ZLTarDfmVEIKoiQrCpzdUzoHbwfFu
         rlN2ORlS1ei7KYlrRrYikWp/gDsG7ZvkmuU/Znf/CNWNRg6QQkrSMtBuyzXiSzBSKlA0
         ocag==
X-Gm-Message-State: APjAAAUZiduxccTpC5IxW3ibvSVZWka7NR91Wl7531yQdHQmGURJ3ljF
        ziO8WpoZhSHPOwXvOvkzEvIlhCmKK+oK3F2erzUgYcvOMUQ=
X-Google-Smtp-Source: APXvYqyALmC0zSw1dhg00TAav9lT6D/cSrYgao+D0D0MYYMWE1c8Kpd3xSzuEnBL9V/h/mtUA3DRZI8/IbM/UXSWuIA=
X-Received: by 2002:aa7:c543:: with SMTP id s3mr6964766edr.272.1571718174764;
 Mon, 21 Oct 2019 21:22:54 -0700 (PDT)
MIME-Version: 1.0
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Mon, 21 Oct 2019 21:22:44 -0700
Message-ID: <CAOCOHw7UfbTZ-oLca2j0U0TfUR-4MPvOdw0chtcvnjeeFgREMQ@mail.gmail.com>
Subject: Update url of rpmsg tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I recently moved the "rpmsg" tree to git.kernel.org, can you please
update the url for the tree to:
git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git

Branch remains "for-next"

Thanks,
Bjorn
